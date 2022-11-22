import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/screens/agency/register_agency_plan.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../constants/global_variables.dart';

class RegisterAgency extends StatefulWidget {
  static const String routeName = '/register-agency';
  RegisterAgency({super.key});

  @override
  State<RegisterAgency> createState() => _RegisterAgencyState();
}

class _RegisterAgencyState extends State<RegisterAgency> {
  bool _checkboxState1 = false;
  var iconState = true;
  bool passwordState = true;

  //String defaultAgencyPhoto = "https://cdn-icons-png.flaticon.com/512/770/770655.png";

  final urlAPI = Uri.parse("${GlobalVariables.url}api/v1/agencies/auth/sign-up");
  final headers = {"Content-Type" : "application/json;charset=UTF-8"};

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  final ruc = TextEditingController();

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
                            newSubtitle("Información de la agencia"),
                            sizedBox(),
                            nameForm(),
                            sizedBox(),
                            accountInformation(context),
                            sizedBox(),
                            _locationForm(),
                            sizedBox(),
                            _descriptionForm(),
                            sizedBox(),
                            condition1("Acepto los términos y condiciones."),
                            const SizedBox(height: 30),
                            continueButton(context)
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
      return 'Su contraseña debe tener al menos 8 caracteres';
    }
    return null;
  }

  String? validateForm(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  String? validateRUC(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (value.length < 11) {
      return 'RUC inválido';
    }
    return null;
  }

  String? validateCellphone(value) {
    if (value!.isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (value.length < 9) {
      return 'Celular inválido';
    }
    return null;
  }

  Container continueButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            if (_keyForm.currentState!.validate() && _checkboxState1 == true) {
              //print("validación exitosa");
              saveAgency();
              Navigator.pushNamed(context, RegisterAgencyPlan.routeName);
            } else {
              //print("error en la validación");
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
            "Continuar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ));
  }
  
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url, path: "Go2Climb-Terms-and-Conditions");
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      )) {
        throw "Can not launch url";
      }
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
        GestureDetector(
          onTap: () {
            _launchURL("will-iam210.github.io");
          },
          child: Text(condition,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xff0000ee),
                fontSize: 16, 
                fontWeight: FontWeight.bold
              )
          ),
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
                  border: InputBorder.none, hintText: "Correo electrónico"),
              validator: (email) => email != null && !EmailValidator.validate(email)
                  ? 'Email inválido'
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
                  hintText: "Contraseña",
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        iconState = !iconState;
                        passwordState = !passwordState;
                      });
                    },
                    child: iconState ? const Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ): const Icon(
                      Icons.visibility
                    )
                  )
          )
      ),
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
                  border: InputBorder.none, hintText: "Nombre de la agencia"))),
    );
  }

  Row accountInformation(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _rucNumber()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, 
            child: _contactNumber()),
      ],
    );
  }

  Container _rucNumber() {
    var rucMask = MaskTextInputFormatter(
        mask: '###########', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateRUC,
              controller: ruc,
              inputFormatters: [rucMask],
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Número RUC"),
              textAlign: TextAlign.center)),
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

  Container _locationForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateForm,
              controller: location,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Ubicación física de la agencia"))),
    );
  }

  Container _descriptionForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
              validator: validateForm,
              controller: description,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Descripción de la agencia"))),
    );
  }
  
  void saveAgency() async{
    final newTourist = {
      "name": name.text, 
      "email": email.text,
      "password": password.text,
      "phoneNumber": phoneNumber.text,
      "description": description.text,
      "location": location.text,
      "ruc": ruc.text,
      //"photo": defaultAgencyPhoto
    };
    await http.post(urlAPI, headers: headers, body: jsonEncode(newTourist));
    name.clear();
    email.clear();
    password.clear();
    phoneNumber.clear();
    description.clear();
    location.clear();
    ruc.clear();
  }
}
