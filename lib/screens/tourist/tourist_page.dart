import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go2climb/components/AppBarGo2Climb.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/tourist/profile_bloc/tourist_bloc.dart';
import 'package:go2climb/screens/tourist/profile_bloc/tourist_event.dart';
import 'package:go2climb/screens/tourist/tourist_profile.dart';
import 'package:http/http.dart' as http;

class TouristPage extends StatelessWidget {
  static const String routeName = '/tourist-profile';

  const TouristPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: const AppBarGo2Climb(),
      body: BlocProvider(
        create: (_) =>
            TouristBloc(httpClient: http.Client())..add(TouristFetched()),
        child: const TouristProfile(),
      ),
    );
  }
}