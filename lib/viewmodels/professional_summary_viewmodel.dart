import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycv/models/professional_summary.dart';
import 'package:mycv/services/data_service.dart';

class ProfessionalSummaryViewModel extends ChangeNotifier {
  final DataService _dataService = DataService();
  ProfessionalSummary? _professionalSummary;

  ProfessionalSummary? get professionalSummary => _professionalSummary;
  List<String> get imageMyStory => _imageMyStory;
  List<String> get imageMyStorySav => _imageMyStorySav;

  Future<ProfessionalSummary?> loadProfessionalSummary() async {
    _professionalSummary = await _dataService.loadProfessionalSummary();
    notifyListeners();
    return _professionalSummary;
  }

  final List<String> _imageMyStory = [
    'images/contact_images/illustration/12.svg',
    'images/contact_images/illustration/13.svg',
    'images/contact_images/illustration/14.svg',
    'images/contact_images/illustration/15.svg',
    'images/contact_images/illustration/16.svg',
    'images/contact_images/illustration/17.svg',
    'images/contact_images/illustration//18.svg',
  ];

  final List<String> _imageMyStorySav = [
    'https://i.imgur.com/KUXteyy.png',
    'https://i.imgur.com/EZqxdWv.png',
    'https://i.imgur.com/xwt2BIH.png',
    'https://i.imgur.com/F68xySV.png',
    'https://i.imgur.com/HBL1GTm.jpg',
    'https://i.imgur.com/DM6BFOh.jpg',
    'https://i.imgur.com/GTtTyCo.jpg',
  ];
}
