import 'package:flutter/material.dart';

// BIG: originalWidth: 180 -  origalHeight: 253
// SMALL: originalWidth: 152 -  origalHeight: 214
const originalWidth = 152.00;
const originalHeight = 214.00;
const textBoxHeight = 50.00;

final proportionHeightToWidth =
    double.parse((originalHeight / originalWidth).toStringAsFixed(2));

class ProportionalDimensions {
  static getHeight(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    final double width = screenWidth / (screenWidth / originalWidth).round();
    return width * proportionHeightToWidth;
  }

  static getWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return screenWidth / (screenWidth / originalWidth).round();
  }

  static getRatio(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    final double width = screenWidth / (screenWidth / originalWidth).round();
    final double height = width * proportionHeightToWidth;
    return width / (height + textBoxHeight);
  }

  static double getHeightForSafeArea(
      BuildContext context, double normalHeight) {
    double safeArea = MediaQuery.of(context).viewPadding.vertical;
    if (safeArea > 0) {
      double statusBarHeight = 60;
      return statusBarHeight + safeArea;
    }
    return normalHeight;
  }
}
