import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/main.dart';
import 'package:go2climb/screens/agency_profile.dart';
import 'package:go2climb/screens/create_agency_service.dart';
import 'package:go2climb/screens/service_detail.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case CreateAgencyService.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CreateAgencyService(),
      );
    case ServiceDetail.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ServiceDetail(),
      );
    case AgencyProfile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AgencyProfile(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyApp(),
      );
  }
}
