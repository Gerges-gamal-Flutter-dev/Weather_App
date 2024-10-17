// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/widgets/onbording_Page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onbordingscreen extends StatefulWidget {
  const Onbordingscreen({super.key});
  static String routeName = '/onbordingScreen';
  @override
  State<Onbordingscreen> createState() => _OnbordingscreenState();
}

class _OnbordingscreenState extends State<Onbordingscreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF009FFD), Color(0xFF2A2A72)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: const [
              OnbordingPage(
                image: 'assets/more-weather-climate.webp',
                description: 'Stay updated with real-time weather trends',
              ),
              OnbordingPage(
                image: 'assets/cem-xtrm-875x530px-hdr.jpg',
                description: 'Monitor extreme weather conditions globally',
              ),
              OnbordingPage(
                image: 'assets/Defence-Artha-Issue-Images22.jpg',
                description: 'Accurate forecasts and alerts',
              ),
            ],
          ),
          Positioned(
            bottom: size.height * 0.08,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                    activeDotColor: Colors.white,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black12,
                    spacing: 12,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 30),
                      ),
                      onPressed: () {
                        pageController.jumpToPage(2);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 30),
                      ),
                      onPressed: () {
                        if (currentIndex == 2) {
                          Navigator.pushReplacementNamed(
                              context, '/HomeScreen');
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        currentIndex == 2 ? 'Get Started' : 'Next',
                        style: TextStyle(
                          color: currentIndex == 2 ? Colors.blue : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
