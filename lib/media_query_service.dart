import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  static double widthPercentage(double percentage) {
    return (screenWidth * percentage) / 100;
  }

  static double heightPercentage(double percentage) {
    return (screenHeight * percentage) / 100;
  }
}
