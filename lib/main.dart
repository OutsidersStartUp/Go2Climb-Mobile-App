import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/auth/blocs/auth_bloc.dart';
import 'package:go2climb/screens/auth/blocs/auth_state.dart';
import 'package:go2climb/screens/auth/repository/auth_repo.dart';
import 'package:go2climb/screens/login_page.dart';
import 'package:go2climb/router.dart';
import 'package:go2climb/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(LoginInitState(), AuthRepository()))
      ],
      child: MaterialApp(
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
        home: LoginPage(),
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
