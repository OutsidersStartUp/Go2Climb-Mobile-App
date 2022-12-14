import 'package:flutter/material.dart';
import 'package:go2climb/main.dart';
import 'package:go2climb/screens/agency/agency_page.dart';
import 'package:go2climb/screens/agency/register_agency.dart';
import 'package:go2climb/screens/agency/register_agency_plan.dart';
import 'package:go2climb/screens/change_agency_plan.dart';
import 'package:go2climb/screens/create_agency_service.dart';
import 'package:go2climb/screens/favorites_view.dart';
import 'package:go2climb/screens/monitor-clients.dart';
import 'package:go2climb/screens/promote_agency_service.dart';
import 'package:go2climb/screens/services_view.dart';
import 'package:go2climb/screens/tourist/register_tourist.dart';
import 'package:go2climb/screens/tourist/tourist_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MonitorClients.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MonitorClients(),
      );
    case ServicesView.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ServicesView(),
      );
    case FavoritesView.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FavoritesView(),
      );
    case CreateAgencyService.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CreateAgencyService(),
      );
    //case ServiceDetail.routeName:
    //  return MaterialPageRoute(
    //    settings: routeSettings,
    //    builder: (_) => ServiceDetail(),
    //  );
    case AgencyPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AgencyPage(),
      );
    /*
    case AgencyProfileEdit.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AgencyProfileEdit(),
      );*/
    case ChangeAgencyPlan.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ChangeAgencyPlan(),
      );
    case TouristPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TouristPage(),
      );
    case PromoteAgencyService.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PromoteAgencyService(),
      );
    case RegisterTourist.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegisterTourist(),
      );
    case RegisterAgency.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegisterAgency(),
      );
    case RegisterAgencyPlan.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterAgencyPlan(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyApp(),
      );
  }
}
