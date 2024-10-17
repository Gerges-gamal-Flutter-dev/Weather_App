// ignore_for_file: non_constant_identifier_names

part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}
class GetWeatherSuccess extends GetWeatherState {
  final List<WeatherModel> weathers;
  GetWeatherSuccess(this.weathers);
}
class WeatherLoading extends GetWeatherState {}
class GetWeatherFailure extends GetWeatherState {
  final String errorMessage;
  GetWeatherFailure({required this.errorMessage});
}

         
         