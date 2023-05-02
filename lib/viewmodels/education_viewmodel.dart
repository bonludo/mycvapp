import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycv/models/education.dart';
import 'package:mycv/services/data_service.dart';

class EducationViewModel extends ChangeNotifier {
  List<Education> _educations = [];
  bool _isLoading = true;
  final List<Icon> _educationIcons = [
    const Icon(Icons.school),
    const Icon(Icons.school),
    const Icon(Icons.school)
  ];

  final List<String> _logoEducation = [
    'images/education_images/logo-udemy.svg',
    'images/education_images/openclassroom_logo.jpg',
    'images/education_images/unicergypontoise.svg',
  ];

  EducationViewModel() {
    loadEducation();
  }

  List<String> get logoEducation => _logoEducation;
  List<Education> get educations => _educations;
  List<Icon> get educationIcons => _educationIcons;

  bool get isLoading => _isLoading;

  Future<void> loadEducation() async {
    _isLoading = true;
    notifyListeners();
    _educations = await DataService.loadEducations();
    _isLoading = false;
    notifyListeners();
  }
}
