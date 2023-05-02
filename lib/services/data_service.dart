import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mycv/models/contact_info.dart';
import 'package:mycv/models/education.dart';
import 'package:mycv/models/interest.dart';
import 'package:mycv/models/professional_summary.dart';
import 'package:mycv/models/skill.dart';
import 'package:mycv/models/work_experience.dart';

class DataService {
  Future<ContactInfo> fetchContactInfo() async {
    String jsonString = await rootBundle.loadString('assets/data.json');

    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return ContactInfo.fromJson(jsonData['CONTACT_INFO']);
  }

  Future<ProfessionalSummary> loadProfessionalSummary() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(jsonString);
    return ProfessionalSummary.fromJson(jsonData['PROFESSIONAL_SUMMARY']);
  }

  static Future<List<Education>> loadEducations() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(jsonString);
    List<Education> educations = (jsonData['EDUCATION'] as List)
        .map((educationJson) => Education.fromJson(educationJson))
        .toList();
    return educations;
  }

  static Future<List<Interest>> loadInterests() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(jsonString);
    List<Interest> interests = (jsonData['INTERESTS'] as List)
        .map((interestJson) => Interest.fromJson(interestJson))
        .toList();
    return interests;
  }

  static Future<List<WorkExperience>> loadWorkExperiences() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(jsonString);
    List<WorkExperience> workExperience = (jsonData['WORK_EXPERIENCE'] as List)
        .map(
            (workExperienceJson) => WorkExperience.fromJson(workExperienceJson))
        .toList();
    return workExperience;
  }

  static Future<List<Skill>> loadSkills() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(jsonString);
    List<Skill> skills = (jsonData['SKILLS'] as List)
        .map((skillJson) => Skill.fromJson(skillJson))
        .toList();
    return skills;
  }
}
