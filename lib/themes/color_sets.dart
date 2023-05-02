import 'package:flutter/material.dart';

class ColorSet {
  final Color primaryColor;
  final Color secondaryColor;
  final Color thirdlyColor;
  final Color textCustomMenu;
  final Color backgroundCustomMenu;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color navButtonColor;
  final Color textDate;
  final Color textNumber;
  final Color textNumberDrawer;

  ColorSet({
      required this.primaryColor,
      required this.secondaryColor,
      required this.thirdlyColor,
    required this.textCustomMenu,
      required this.backgroundCustomMenu,
      required this.primaryTextColor,
      required this.secondaryTextColor,
      required this.navButtonColor,
      required this.textDate,
      required this.textNumber,
      required this.textNumberDrawer,
  });
}

Map<String, ColorSet> colorMap = {
  'pinkThemeLight': ColorSet(
      primaryColor:const Color(0xFFf37b83),
      secondaryColor: const Color(0xFFD46D74),
      thirdlyColor:const Color(0xFFFD828A),
      textCustomMenu:Colors.white,
      backgroundCustomMenu: const Color(0xFF272727),
      primaryTextColor: Colors.white,
      secondaryTextColor: Colors.black,
      navButtonColor: const Color(0xFFB53434),
      textDate: Colors.white54,
      textNumber: Colors.black45,
      textNumberDrawer: Colors.black38),

  'pinkThemeDark': ColorSet(
      primaryColor:const Color(0xFFD46D74),
      secondaryColor: const Color(0xFFDF7078),
      thirdlyColor:const Color(0xFFB54E54),
      textCustomMenu:Colors.white,
      backgroundCustomMenu: const Color(0xFF272727),
      primaryTextColor: Colors.black,
      secondaryTextColor: Colors.white,
      navButtonColor: const Color(0xFFB53434),
      textDate: Colors.black54,
      textNumber: Colors.white38,
      textNumberDrawer: Colors.white38),

  'GreenThemeLight': ColorSet(
      primaryColor:const Color(0xFF4FA89D),
      secondaryColor: const Color(0xFF3D968B),
      thirdlyColor:const Color(0xFF5CBAAE),
      textCustomMenu:Colors.white,
      backgroundCustomMenu: const Color(0xFF272727),
      primaryTextColor: Colors.white,
      secondaryTextColor: Colors.black,
      navButtonColor: const Color(0xFF1D5952),
      textDate: Colors.white54,
      textNumber: Colors.black45,
      textNumberDrawer: Colors.black38),

  'GreenThemeDark': ColorSet(
      primaryColor:const Color(0xFF3D968B),
secondaryColor: const Color(0xFF4FA89D),
      thirdlyColor:const Color(0xFF5CBAAE),
      textCustomMenu:Colors.white,
      backgroundCustomMenu: const Color(0xFF272727),
      primaryTextColor: Colors.black,
      secondaryTextColor: Colors.white,
      navButtonColor: const Color(0xFF1D5952),
      textDate: Colors.black54,
      textNumber: Colors.white38,
      textNumberDrawer: Colors.white38),
};
