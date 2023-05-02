import 'package:flutter/material.dart';
import 'package:mycv/models/contact_info.dart';
import 'package:mycv/services/data_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeViewModel extends ChangeNotifier {
  ContactInfo? _contactInfo;

  ContactMeViewModel() {
    fetchContactInfo();
  }

  Future<void> fetchContactInfo() async {
    DataService dataService = DataService();
    _contactInfo = await dataService.fetchContactInfo();
    notifyListeners();
  }

  Future<void> contactByEmail() async {
    final url = Uri.parse('mailto:${_contactInfo!.mail}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> shareWebsite() async {
    final url = Uri.parse('https://www.bonbondev.com');
    await Share.share('Voici un webcv intéractif fait sur mobile : $url');
  }

  Future<void> contactByPhone() async {
    final url = Uri.parse('tel:${_contactInfo!.phone}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } Future<void> contactGithub() async {
    final url = Uri.parse('https://github.com/bonludo');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> requestStoragePermission() async {
    // Vérifier si l'autorisation d'accès au stockage est déjà accordée
    var status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
      return true;
    }
    // Demander l'autorisation d'accéder au stockage
    status = await Permission.storage.request();
    return status == PermissionStatus.granted;
  }
}
