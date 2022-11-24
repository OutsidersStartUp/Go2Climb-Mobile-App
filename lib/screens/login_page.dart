import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency/agency_page.dart';
import 'package:go2climb/screens/agency/register_agency.dart';
import 'package:go2climb/screens/auth/blocs/auth_bloc.dart';
import 'package:go2climb/screens/auth/blocs/auth_events.dart';
import 'package:go2climb/screens/auth/blocs/auth_state.dart';
import 'package:go2climb/screens/services_view.dart';
import 'package:go2climb/screens/tourist/register_tourist.dart';

import '../constants/global_variables.dart';

class LoginPage extends StatefulWidget {
  static const String RouteName = '/login_page';
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final msg = BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoginErrorState) {
          return const Text("Error al momento de verificar sus datos.");
        } else if (state is LoginLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );

    return Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(title: const Text("Iniciar sesion")),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is CustomerLoginSuccessState) {
              Navigator.pushNamed(context, ServicesView.routeName);
            } else if (state is AgencyLoginSuccessState) {
              Navigator.pushNamed(context, AgencyPage.routeName);
            }
          },
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      newSubHeading("Te damos la bienvenida a Go2Climb"),
                      sizedBox(),
                      emailContainer(),
                      sizedBox(),
                      passwordContainer(),
                      sizedBox(),
                      loginButton(context),
                      msg,
                      sizedBox(),
                      sizedBox(),
                      newSubHeading("Aun no tienes una cuenta?"),
                      sizedBox(),
                      registerCustomerButton(context),
                      sizedBox(),
                      registerAgencyButton(context)
                    ],
                  ))
            ],
          )),
        ));
  }

  SizedBox sizedBox() => const SizedBox(height: 15);

  Container loginButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            authBloc.add(LoginButtonPressed(
                email: emailController.text,
                password: passwordController.text));
          },
          style: ButtonStyle(
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size(double.infinity, 40)),
            backgroundColor: const MaterialStatePropertyAll<Color>(
                GlobalVariables.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(GlobalVariables.borderRadius),
              ),
            ),
          ),
          child: const Text(
            "Iniciar sesion",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ));
  }

  Container registerAgencyButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: ((context) => AlertDialog(
                    title: const Text("¡Enhorabuena!"),
                    content: const Text("Plan actualizado exitosamente"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Aceptar"),
                        onPressed: () {
                          Navigator.pushNamed(context, ServicesView.routeName);
                        },
                      )
                    ],
                  )),
            );
          },
          style: ButtonStyle(
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size(double.infinity, 40)),
            backgroundColor: const MaterialStatePropertyAll<Color>(
                GlobalVariables.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(GlobalVariables.borderRadius),
              ),
            ),
          ),
          child: const Text(
            "Registrate y ofrece servicios turisticos",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ));
  }

  Container registerCustomerButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: ((context) => AlertDialog(
                    title: const Text("¡Enhorabuena!"),
                    content: const Text("Plan actualizado exitosamente"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Aceptar"),
                        onPressed: () {
                          Navigator.pushNamed(context, ServicesView.routeName);
                        },
                      )
                    ],
                  )),
            );
          },
          style: ButtonStyle(
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size(double.infinity, 40)),
            backgroundColor: const MaterialStatePropertyAll<Color>(
                GlobalVariables.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(GlobalVariables.borderRadius),
              ),
            ),
          ),
          child: const Text(
            "Registrate y disfruta tu aventura",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ));
  }

  Container emailContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Correo electronico"))),
    );
  }

  Container passwordContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Contraseña"))),
    );
  }

  Row newSubHeading(String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}










  //     child: Scaffold(
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Flexible(
  //                 child: Image.network(
  //               GlobalVariables.logo,
  //               height: 200.0,
  //             )),
  //             const SizedBox(
  //               height: 15.0,
  //             ),
  //             _userTextField(),
  //             SizedBox(
  //               height: 15,
  //             ),
  //             _passwordTextField(),
  //             SizedBox(
  //               height: 20.0,
  //             ),
  //             _bottonLogin(),
  //             SizedBox(
  //               height: 20.0,
  //             ),
  //             _bottonLogin2(),
  //             const SizedBox(
  //               height: 20.0,
  //             ),
  //             _bottonRegisterClient(),
  //             SizedBox(
  //               height: 20.0,
  //             ),
  //             _bottonRegisterAgency(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _userTextField() {
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 35.0),
  //       child: TextField(
  //         keyboardType: TextInputType.emailAddress,
  //         decoration: InputDecoration(
  //           icon: Icon(Icons.email),
  //           hintText: 'ejemplo@correo.com',
  //           labelText: 'Correo electrónico',
  //         ),
  //         onChanged: (value) {},
  //       ),
  //     );
  //   });
  // }

  // Widget _passwordTextField() {
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 35.0),
  //       child: TextField(
  //         keyboardType: TextInputType.emailAddress,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           icon: Icon(Icons.lock),
  //           hintText: 'Contraseña',
  //           labelText: 'Contraseña',
  //         ),
  //         onChanged: (value) {},
  //       ),
  //     );
  //   });
  // }

  // Widget _bottonLogin() {
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return ElevatedButton(
  //       onPressed: () {
  //         Navigator.pushNamed(context, ServicesView.routeName);
  //       },
  //       child: const Text("Iniciar Sesión"),
  //     );
  //   });
  // }

  // //Borrar ↓
  // Widget _bottonLogin2() {
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return ElevatedButton(
  //       onPressed: () {
  //         Navigator.pushNamed(context, AgencyPage.routeName);
  //       },
  //       child: const Text("Iniciar como agencia"),
  //     );
  //   });
  // }

  // Widget _buttonRegisterCustomer() {
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return ElevatedButton(
  //       onPressed: () {
  //         Navigator.pushNamed(context, RegisterTourist.routeName);
  //       },
  //       child: const Text("Regístrate y disfruta tu aventura"),
  //     );
  //   });
  // }

  // Widget _buttonRegisterAgency() {
  //   return StreamBuilder(
  //       builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return ElevatedButton(
  //       onPressed: () {
  //         Navigator.pushNamed(context, RegisterAgency.routeName);
  //       },
  //       child: const Text("Regístrate y ofrece servicios turisticos"),
  //     );
  //   });
  // }
