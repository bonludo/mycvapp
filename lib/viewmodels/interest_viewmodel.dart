import 'package:flutter/material.dart';
import 'package:mycv/models/interest.dart';
import 'package:mycv/services/data_service.dart';

class InterestViewModel extends ChangeNotifier {
  List<Interest> _interests = [];

  final List<String> _interestImages = [
    'assets/images/interest_images/4game.jpg',
    'assets/images/interest_images/1film.jpg',
    'assets/images/interest_images/2voyage.jpg',
    'assets/images/interest_images/3colorful.jpg',
    'assets/images/interest_images/5phone.jpg'
  ];

  List<String> get interestImages => _interestImages;
  List<Interest> get interests => _interests;

  InterestViewModel() {
    loadInterests();
  }

  Future<void> loadInterests() async {
    _interests = await DataService.loadInterests();
    notifyListeners();
  }
}
