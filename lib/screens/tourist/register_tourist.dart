import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/screens/login_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../constants/global_variables.dart';

class RegisterTourist extends StatefulWidget {
  static const String routeName = '/register-tourist';
  RegisterTourist({super.key});

  @override
  State<RegisterTourist> createState() => _RegisterTouristState();
}

class _RegisterTouristState extends State<RegisterTourist> {
  bool _checkboxState1 = false;
  bool _checkboxState2 = false;
  var iconState = true;
  bool passwordState = true;
  //String defaultTouristPhoto = "https://cdn-icons-png.flaticon.com/512/2102/2102633.png";

  final urlAPI =
      Uri.parse("${GlobalVariables.url}api/v1/customers/auth/sign-up");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};

  final name = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          title: const Text("Registrarse"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        color: GlobalVariables.whiteColor,
                        borderRadius: BorderRadius.circular(
                            GlobalVariables.borderRadius)),
                    child: Form(
                      key: _keyForm,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            newSubtitle("Te damos la bienvenida a Go2Climb"),
                            sizedBox(),
                            emailForm(),
                            sizedBox(),
                            passwordForm(),
                            sizedBox(),
                            newSubtitle("Informaci??n de la cuenta"),
                            sizedBox(),
                            nameForm(),
                            sizedBox(),
                            lastNameForm(),
                            sizedBox(),
                            accountInformation(context),
                            sizedBox(),
                            condition1("Declaro tener +18 a??os de edad."),
                            condition2("Acepto los t??rminos y condiciones."),
                            const SizedBox(height: 60),
                            finishButton(context)
                          ]),
                    ))
              ]))
        ])));
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (value.length < 8) {
      return 'Su contrase??a debe tener al menos 8 caracteres';
    }
    return null;
  }

  String? validateForm(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  String? validateCellphone(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (value.length < 9) {
      return 'Celular inv??lido';
    }
    return null;
  }

  Container finishButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            if (_keyForm.currentState!.validate() && _checkboxState1 == true && _checkboxState2 == true) {
              //print("validaci??n exitosa");
              saveTourist();
              Navigator.pushNamed(context, LoginPage.RouteName);
            } else {
              //print("error en la validaci??n");
            }
          },
          style: ButtonStyle(
            minimumSize:
                const MaterialStatePropertyAll<Size>(Size(double.infinity, 40)),
            backgroundColor: const MaterialStatePropertyAll<Color>(
                GlobalVariables.primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: const Text(
            "Finalizar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ));
  }

  Row condition1(String condition) {
    return Row(
      children: [
        Checkbox(
            value: _checkboxState1,
            onChanged: (value) {
              _checkboxState1 = value!;
              setState(() {});
            }),
        Text(condition,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri =
        Uri(scheme: "https", host: url, path: "Go2Climb-Terms-and-Conditions");
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Row condition2(String condition) {
    return Row(
      children: [
        Checkbox(
            value: _checkboxState2,
            onChanged: (value) {
              _checkboxState2 = value!;
              setState(() {});
            }),
        GestureDetector(
          onTap: () {
            _launchURL("will-iam210.github.io");
          },
          child: Text(condition,
              style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff0000ee),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  SizedBox sizedBox() => const SizedBox(height: 15);

  Column newSubtitle(String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Container emailForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "Correo electr??nico"),
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Email inv??lido'
            : null,
      )),
    );
  }

  Container passwordForm() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: TextFormField(
              validator: validatePassword,
              controller: password,
              obscureText: passwordState,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Contrase??a",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          iconState = !iconState;
                          passwordState = !passwordState;
                        });
                      },
                      child: iconState
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(Icons.visibility)))),
        ));
  }

  Container nameForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateForm,
              controller: name,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Nombres"))),
    );
  }

  Container lastNameForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateForm,
              controller: lastName,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Apellidos"))),
    );
  }

  Row accountInformation(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _contactNumber()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, 
            child: _country()),
      ],
    );
  }

  Container _contactNumber() {
    var cellphoneMask = MaskTextInputFormatter(
        mask: '#########', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateCellphone,
              controller: phoneNumber,
              inputFormatters: [cellphoneMask],
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Celular"),
              textAlign: TextAlign.center)),
    );
  }

  Container _country() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateForm,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Pa??s"),
              textAlign: TextAlign.center)),
    );
  }

  void saveTourist() async {
    final newTourist = {
      "name": name.text,
      "lastName": lastName.text,
      "email": email.text,
      "password": password.text,
      "phoneNumber": phoneNumber.text,
      //"photo": defaultTouristPhoto
    };
    await http.post(urlAPI, headers: headers, body: jsonEncode(newTourist));
    name.clear();
    lastName.clear();
    email.clear();
    password.clear();
    phoneNumber.clear();
  }
}
