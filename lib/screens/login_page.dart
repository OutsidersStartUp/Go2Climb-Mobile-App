import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency_profile.dart';
import 'package:go2climb/screens/services_view.dart';

import '../constants/global_variables.dart';

class LoginPage extends StatefulWidget {
  static const String RouteName = '/login_page';
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Image.network(GlobalVariables.logo,
                    height: 200.0,
                  )
              ),
              SizedBox(height: 15.0,),
              _userTextField(),
              SizedBox(height: 15,),
              _passwordTextField(),
              SizedBox(height: 20.0,),
              _bottonLogin(),
              SizedBox(height: 20.0,),
              _bottonRegisterClient(),
              SizedBox(height: 20.0,),
              _bottonRegisterAgency(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electronico',
              ),
              onChanged: (value){

              },
            ),
          );
        }
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Contrasena',
                labelText: 'Contrasena',
              ),
              onChanged: (value){

              },
            ),
          );
        }
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder:(BuildContext context, AsyncSnapshot snapshot){
          return ElevatedButton(

            onPressed: () {
              Navigator.pushNamed(
                  context, ServicesView.routeName);
            },
            child: Text("Iniciar Sesión"),
          );
        }
    );
  }

  Widget _bottonRegisterClient() {
    return StreamBuilder(
        builder:(BuildContext context, AsyncSnapshot snapshot){
          return ElevatedButton(

            onPressed: () {
              Navigator.pushNamed(
                  context, ServicesView.routeName);
            },
            child: Text("Registrate y disfruta tu aventura"),
          );
        }
    );
  }

  Widget _bottonRegisterAgency() {
    return StreamBuilder(
        builder:(BuildContext context, AsyncSnapshot snapshot){
          return ElevatedButton(

            onPressed: () {
              Navigator.pushNamed(
                  context, AgencyProfile.routeName);
            },
            child: Text("Registrate y ofrece servicios turisticos"),
          );
        }
    );
  }
}

