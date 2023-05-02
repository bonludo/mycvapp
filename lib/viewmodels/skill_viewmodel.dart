import 'package:flutter/material.dart';
import 'package:mycv/models/skill.dart';
import 'package:mycv/services/data_service.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class SkillViewModel extends ChangeNotifier {
  List<Skill> _skills = [];

  // final List<String> _imageSkill = [
  //   'images/skill_images/1prog.jpg',
  //   'images/skill_images/2fram.jpg',
  //   'images/skill_images/3dev.jpg',
  //   'images/skill_images/4data.jpg',
  //   'images/skill_images/5firgith.jpg',
  //   'images/skill_images/6metho.jpg',
  //   'images/skill_images/7comp.jpg',
  // ];

  final List<String> _imageSkillCode0 = [
    'assets/images/skill_images/mainicon/1.png',
    'assets/images/skill_images/mainicon/2.png',
    'assets/images/skill_images/mainicon/3.png',
    'assets/images/skill_images/mainicon/4.png',
    'assets/images/skill_images/mainicon/5.png',
    'assets/images/skill_images/mainicon/6.png',
    'assets/images/skill_images/mainicon/7.png',
  ];

  // List<String> get imageSkill => _imageSkill;
  List<Skill> get skills => _skills;
  List<String> get imageSkillCode0 => _imageSkillCode0;

  SkillViewModel() {
    loadSkills();
  }

  Future<List<Skill>> loadSkills() async {
    _skills = await DataService.loadSkills();
    notifyListeners();
    return _skills;
  }
}
