import 'package:flutter/material.dart';
import 'package:mycv/models/config/themeconfig.dart';
import 'package:mycv/models/contact_info.dart';
import 'package:mycv/services/data_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoViewModel extends ChangeNotifier {
  List<Color> backgroundColors = ThemeConfig.backgroundColors;
  List<Color> rippleColors = ThemeConfig.rippleColors;

  final DataService _dataService = DataService();
  ContactInfo? _contactInfo;

  TextStyle optionStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  ContactInfo? get contactInfo => _contactInfo;

  Future<ContactInfo?> loadContactInfo() async {
    _contactInfo = await _dataService.fetchContactInfo();
    notifyListeners();
    return _contactInfo;
  }

  Future<void> launchURL(String contact) async {
    final url = Uri.parse(contact);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
