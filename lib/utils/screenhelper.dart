import 'package:flutter/material.dart';

enum ScreenSize {
  small,
  medium,
  large,
}

class ScreenHelper {
  static ScreenSize getScreenSize(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 820) {
      return ScreenSize.large;
    } else if (screenWidth >= 600) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }


  static double getFontBasedOnScreenSize(
      BuildContext context, double smallSize, double mediumSize, double largeSize) {
    final ScreenSize screenSize = getScreenSize(context);
    switch (screenSize) {
      case ScreenSize.small:
        return smallSize;
      case ScreenSize.medium:
        return mediumSize;
      case ScreenSize.large:
        return largeSize;
      default:
        return mediumSize;
    }
  }

  //définir une largeur
  static double getWidthBasedOnScreenSize(
      BuildContext context, double smallWidth, double mediumWidth, double largeWidth) {
    final ScreenSize screenSize = getScreenSize(context);
    switch (screenSize) {
      case ScreenSize.small:
        return smallWidth;
      case ScreenSize.medium:
        return mediumWidth;
      case ScreenSize.large:
        return largeWidth;
      default:
        return mediumWidth;
    }
  }

// définir une hauteur
  static double getHeightBasedOnScreenSize(
      BuildContext context, double smallHeight, double mediumHeight, double largeHeight) {
    final ScreenSize screenSize = getScreenSize(context);
    switch (screenSize) {
      case ScreenSize.small:
        return smallHeight;
      case ScreenSize.medium:
        return mediumHeight;
      case ScreenSize.large:
        return largeHeight;
      default:
        return mediumHeight;
    }
  }
  //how to use
  //ScreenHelper.getFontBasedOnScreenSize(context, 16, 20, 24);
}
