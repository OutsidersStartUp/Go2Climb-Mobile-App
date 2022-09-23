import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/main.dart';
import 'package:go2climb/screens/agency_profile.dart';
import 'package:go2climb/screens/create_agency_service.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case CreateAgencyService.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CreateAgencyService(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyApp(),
      );
  }
}
