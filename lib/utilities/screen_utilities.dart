import 'package:flutter/material.dart';

class ScreenUtils {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double scaleWidth(BuildContext context, double? value) {
    return screenWidth(context) * (value ?? 1);
  }

  static double scaleHeight(BuildContext context, double? value) {
    return screenHeight(context) * (value ?? 1);
  }
}
