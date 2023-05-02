import 'package:flutter/material.dart';
import 'package:mycv/navigation/view_identifiers.dart';

class MyRouterInformationParser extends RouteInformationParser<ViewIdentifier> {
  @override
  Future<ViewIdentifier> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if (uri.pathSegments.isEmpty) {
      return ViewIdentifier.contactInfo;
    }
    final path = uri.pathSegments[0];
    switch (path) {
      case 'contactinfo':
        return ViewIdentifier.contactInfo;
      case 'education':
        return ViewIdentifier.education;
      case 'workexperience':
        return ViewIdentifier.workExperience;
      case 'skills':
        return ViewIdentifier.skills;
      case 'interests':
        return ViewIdentifier.interests;
      default:
        return ViewIdentifier.contactInfo;
    }
  }

  @override
  RouteInformation? restoreRouteInformation(ViewIdentifier viewIdentifier) {
    switch (viewIdentifier) {
      case ViewIdentifier.contactInfo:
        return RouteInformation(location: '/contactinfo');
      case ViewIdentifier.education:
        return RouteInformation(location: '/education');
      case ViewIdentifier.workExperience:
        return RouteInformation(location: '/workexperience');
      case ViewIdentifier.skills:
        return RouteInformation(location: '/skills');
      case ViewIdentifier.interests:
        return RouteInformation(location: '/interests');
      default:
        return null;
    }
  }
}
