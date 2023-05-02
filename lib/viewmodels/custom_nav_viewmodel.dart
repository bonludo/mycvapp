import 'package:flutter/material.dart';
import 'package:mycv/models/config/themeconfig.dart';

class ConfigViewModel extends ChangeNotifier {
  List<Color> backgroundColors = ThemeConfig.backgroundColors;
  List<Color> rippleColors = ThemeConfig.rippleColors;

  List<String> titles = <String>[
    'Qui suis-je ? ', // About Me
    'Mon Parcours', // School
    'Expériences', // Work
    'Compétences', // Skill
    'Intérêts', // Interest
  ];

  final List<IconData> _icons = [
    Icons.person_2_outlined, // About Me
    Icons.school_outlined, // School Icon
    Icons.work_outline_rounded, // Work Icon
    Icons.code_outlined, // Skill Icon
    Icons.games_outlined, // Interest Icon
  ];

  List<IconData> get icons => _icons;
}
