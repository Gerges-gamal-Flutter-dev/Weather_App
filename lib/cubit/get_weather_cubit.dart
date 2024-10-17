// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());

  Future<List<WeatherModel>> getWeather({required String city}) async {
    try {
      emit(WeatherLoading());
      Response response = await Dio().get(
        "http://api.weatherapi.com/v1/forecast.json?key=c9ff61e482ca4f27984155623241010&q=$city&days=3&aqi=no&alerts=no",
      );

      List<WeatherModel> weathers = [
        WeatherModel.fromJson(response.data, 0),
        WeatherModel.fromJson(response.data, 1),
        WeatherModel.fromJson(response.data, 2),
      ];

      emit(GetWeatherSuccess(weathers));
      return weathers;
    } on DioException catch (e) {
      final errorMessage = e.response?.data["error"]["message"] ??
          "Something went wrong, status code: ${e.response?.statusCode}";
      emit(GetWeatherFailure(errorMessage: errorMessage));
      return [];
    } catch (e) {
      emit(GetWeatherFailure(errorMessage: e.toString()));
      return [];
    }
  }
}
