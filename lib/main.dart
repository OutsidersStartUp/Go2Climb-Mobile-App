import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/router.dart';
import 'package:go2climb/screens/agency_profile.dart';
import 'package:go2climb/screens/services_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go2Climb Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            ColorScheme.fromSeed(seedColor: GlobalVariables.primaryColor),
        primarySwatch: Colors.blue,
      ),
      home: ServicesView(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
