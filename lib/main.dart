import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go2Climb Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: const Text('Go2Climb'),
    );
  }
}
