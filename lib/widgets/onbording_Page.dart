// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage(
      {super.key, required this.image, required this.description});
  final String image;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(image),
        Text(description),
      ],
    );
  }
}
