import 'package:flutter/material.dart';
import 'package:go2climb/screens/login_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          newSubtitle("Te damos la bienvenida a Go2Climb"),
                          sizedBox(),
                          emailForm(),
                          sizedBox(),
                          passwordForm(),
                          sizedBox(),
                          newSubtitle("Información de la cuenta"),
                          sizedBox(),
                          nameForm(),
                          sizedBox(),
                          lastNameForm(),
                          sizedBox(),
                          accountInformation(context),
                          sizedBox(),
                          condition1("Declaro tener +18 años de edad."),
                          condition2("Acepto los términos y condiciones."),
                          const SizedBox(height: 60),
                          finishButton(context)
                        ]))
              ]))
        ])));
  }

  Container finishButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.RouteName);
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

  Row condition2(String condition) {
    return Row(
      children: [
        Checkbox(
            value: _checkboxState2,
            onChanged: (value) {
              _checkboxState2 = value!;
              setState(() {});
            }),
        Text(condition,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Correo electrónico"))),
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
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Contraseña"))),
    );
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
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "País"),
              textAlign: TextAlign.center)),
    );
  }
}
