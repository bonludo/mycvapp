import 'package:flutter/material.dart';
import 'package:mycv/navigation/path_information.dart';
import 'package:mycv/navigation/view_identifiers.dart';
import 'package:mycv/views/contact_info_view.dart';
import 'package:mycv/views/education_view.dart';
import 'package:mycv/views/interest_view.dart';
import 'package:mycv/views/skill_view.dart';
import 'package:mycv/views/work_experience_view.dart';

class MyRouterDelegate extends RouterDelegate<PathInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PathInformation> {

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  ViewIdentifier _selectedViewIdentifier = ViewIdentifier.contactInfo;

  ViewIdentifier get selectedViewIdentifier => _selectedViewIdentifier;

  set selectedViewIdentifier(ViewIdentifier value) {
    _selectedViewIdentifier = value;
    notifyListeners();
  }

  @override
  PathInformation get currentConfiguration {
    return PathInformation(viewIdentifier: _selectedViewIdentifier);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: ContactInfoView()),
        if (_selectedViewIdentifier == ViewIdentifier.education)
          MaterialPage(child: EducationView()),
        if (_selectedViewIdentifier == ViewIdentifier.workExperience)
          MaterialPage(child: WorkExperienceView()),
        if (_selectedViewIdentifier == ViewIdentifier.skills)
          const MaterialPage(child: SkillView()),
        if (_selectedViewIdentifier == ViewIdentifier.interests)
          MaterialPage(child: InterestView()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedViewIdentifier = ViewIdentifier.contactInfo;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PathInformation configuration) async {
    _selectedViewIdentifier = configuration.viewIdentifier;
  }
}
