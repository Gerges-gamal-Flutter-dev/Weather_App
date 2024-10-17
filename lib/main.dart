import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/cubit/Theme.dart';
import 'package:flutter_weather_app/cubit/get_weather_cubit.dart';
import 'package:flutter_weather_app/views/Splash_Screen.dart';
import 'package:flutter_weather_app/views/homeScreen.dart';
import 'package:flutter_weather_app/views/onbordingScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetWeatherCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            routes: {
              '/SplashScreen': (context) => const Splashscreen(),
              '/OnbordingScreen': (context) => const Onbordingscreen(),
              '/HomeScreen': (context) => const Homescreen(),
            },
            initialRoute: '/SplashScreen',
          );
        },
      ),
    );
  }
}
