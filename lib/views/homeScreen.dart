// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/cubit/Theme.dart';
import 'package:flutter_weather_app/cubit/get_weather_cubit.dart';
import 'package:flutter_weather_app/views/search.dart';
import 'package:flutter_weather_app/widgets/get_weather.dart';
import 'package:flutter_weather_app/widgets/no_weather_data.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  static const routeName = '/homeScreen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkTheme
                ? [Colors.black87, Colors.black54]
                : [const Color(0xFF009FFD), const Color(0xFF2A2A72)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.brightness_6),
                    color: Colors.white,
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
                  builder: (context, state) {
                    if (state is GetWeatherSuccess) {
                      return GetWeather(WeatherList: state.weathers);
                    } else if (state is WeatherLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const NoWeatherData();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
