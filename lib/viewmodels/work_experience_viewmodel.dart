import 'package:flutter/material.dart';
import 'package:mycv/models/work_experience.dart';
import 'package:mycv/services/data_service.dart';

class WorkExperienceViewModel extends ChangeNotifier {
  List<WorkExperience> _workExperiences = [];

  final List<String> _workImages = [
    'assets/images/work_images/work0.svg',
    'assets/images/work_images/work1.svg',
    'assets/images/work_images/work1.svg',
    'assets/images/work_images/work2.svg'
  ];

  List<String> get workImages => _workImages;
  List<WorkExperience> get workExperiences => _workExperiences;

  WorkExperienceViewModel() {
    loadWorkExperiences();
  }

  Future<void> loadWorkExperiences() async {
    _workExperiences = await DataService.loadWorkExperiences();
    notifyListeners();
  }
}
