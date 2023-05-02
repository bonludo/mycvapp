import 'package:flutter/material.dart';

class CustomScrollBehavior extends ScrollBehavior {
  final Color overscrollGlowColor;

  CustomScrollBehavior({required this.overscrollGlowColor});

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      axisDirection: axisDirection,
      color: overscrollGlowColor,
      child: child,
    );
  }

}


