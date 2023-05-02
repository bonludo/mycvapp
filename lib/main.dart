import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycv/themes/color_provider.dart';
import 'package:mycv/views/custom_nav.dart';
import 'package:mycv/themes/color_sets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Color _primaryColor = const Color(0xFFf37b83);
  late Color _secondaryColor = const Color(0xFFD46D74);
  late Color _thirdlyColor = const Color(0xFFFD828A);
  late Color _textCustomMenu = Colors.white;
  late Color _backgroundCustomMenu = const Color(0xFF272727);
  late Color _primaryTextColor = Colors.white;
  late Color _secondaryTextColor = Colors.black;
  late Color _navButtonColor = const Color(0xFFB53434);
  late Color _textDate = Colors.white54;
  late Color _textNumber = Colors.black45;
  late Color _textNumberDrawer = Colors.black38;

  void _changeColors(String colorKey) {
    setState(() {
      _primaryColor = colorMap[colorKey]?.primaryColor ?? _primaryColor;
      _secondaryColor = colorMap[colorKey]?.secondaryColor ?? _secondaryColor;
      _thirdlyColor = colorMap[colorKey]?.thirdlyColor ?? _thirdlyColor;
      _textCustomMenu = colorMap[colorKey]?.textCustomMenu ?? _textCustomMenu;
      _backgroundCustomMenu =
          colorMap[colorKey]?.backgroundCustomMenu ?? _backgroundCustomMenu;
      _primaryTextColor =
          colorMap[colorKey]?.primaryTextColor ?? _primaryTextColor;
      _secondaryTextColor =
          colorMap[colorKey]?.secondaryTextColor ?? _secondaryTextColor;
      _navButtonColor = colorMap[colorKey]?.navButtonColor ?? _navButtonColor;
      _textDate = colorMap[colorKey]?.textDate ?? _textDate;
      _textNumber = colorMap[colorKey]?.textNumber ?? _textNumber;
      _textNumberDrawer =
          colorMap[colorKey]?.textNumberDrawer ?? _textNumberDrawer;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
      ),
    );

    return ColorProvider(
      primaryColor: _primaryColor,
      secondaryColor: _secondaryColor,
      backgroundCustomMenu: _backgroundCustomMenu,
      primaryTextColor: _primaryTextColor,
      secondaryTextColor: _secondaryTextColor,
      navButtonColor: _navButtonColor,
      textDate: _textDate,
      textNumber: _textNumber,
      textNumberDrawer: _textNumberDrawer,
      textCustomMenu: _textCustomMenu,
      thirdlyColor: _thirdlyColor,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BonbonDev WebApp',
        home: CustomNav(),
      ),
    );
  }
}
