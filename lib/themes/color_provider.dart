import 'package:flutter/material.dart';

class ColorProvider extends InheritedWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textCustomMenu;
  final Color backgroundCustomMenu;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color thirdlyColor;
  final Color navButtonColor;
  final Color textDate;
  final Color textNumber;
  final Color textNumberDrawer;

  const ColorProvider({super.key,
    required this.primaryColor,
    required this.textCustomMenu,
    required this.secondaryColor,
    required this.backgroundCustomMenu,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.thirdlyColor,
    required this.navButtonColor,
    required this.textDate,
    required this.textNumber,
    required this.textNumberDrawer,
    required Widget child,
  }) : super(child: child);


  static ColorProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorProvider>()!;
  }

  @override
  bool updateShouldNotify(ColorProvider oldWidget) {
    return primaryColor != oldWidget.primaryColor ||
        secondaryColor != oldWidget.secondaryColor ||
        thirdlyColor != oldWidget.thirdlyColor ||
        textCustomMenu != oldWidget.textCustomMenu ||
        backgroundCustomMenu != oldWidget.backgroundCustomMenu ||
        primaryTextColor != oldWidget.primaryTextColor ||
        secondaryTextColor != oldWidget.secondaryTextColor ||
        navButtonColor != oldWidget.navButtonColor ||
        textDate != oldWidget.textDate ||
        textNumber != oldWidget.textNumber ||
        textNumberDrawer != oldWidget.textNumberDrawer;
  }
}
