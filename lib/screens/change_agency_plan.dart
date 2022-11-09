import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency/agency_page.dart';
import 'package:go2climb/screens/services_view.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ChangeAgencyPlan extends StatefulWidget {
  static const String routeName = '/change-agency-plan';
  const ChangeAgencyPlan({super.key});

  @override
  State<ChangeAgencyPlan> createState() => _ChangeAgencyPlanState();
}

class _ChangeAgencyPlanState extends State<ChangeAgencyPlan> {
  Color basicPlanColor = GlobalVariables.whiteColor;
  Color standardPlanColor = GlobalVariables.whiteColor;
  Color premiumPlanColor = GlobalVariables.whiteColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(title: const Text("Cambiar plan")),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration:
                  const BoxDecoration(color: GlobalVariables.whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  newSubHeading('Selecciona un plan'),
                  Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          basicPlanColor = Color.fromARGB(255, 150, 150, 150);
                          standardPlanColor = GlobalVariables.whiteColor;
                          premiumPlanColor = GlobalVariables.whiteColor;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: basicPlanColor,
                            border: Border.all(
                                width: 3, color: GlobalVariables.primaryColor),
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(25)),
                          ),
                          child: Column(children: [
                            const Text("Plan Basico"),
                            IconButton(
                              iconSize: 45,
                              onPressed: () {},
                              icon: Image.network(
                                GlobalVariables.basicKey,
                              ),
                            ),
                            const Text(
                              "Publicar 3 servicios",
                              textAlign: TextAlign.center,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text("20.00 USD",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            )
                          ]),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          standardPlanColor = Color.fromARGB(255, 150, 150, 150);
                          basicPlanColor = GlobalVariables.whiteColor;
                          premiumPlanColor = GlobalVariables.whiteColor;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: standardPlanColor,
                              border: Border.all(
                                  width: 3, color: GlobalVariables.primaryColor),
                            ),
                            child: Column(children: [
                              const Text("Plan Estandar"),
                              IconButton(
                                iconSize: 45,
                                onPressed: () {},
                                icon: Image.network(
                                  GlobalVariables.standardKey,
                                ),
                              ),
                              const Text(
                                "Publicar 10 servicios",
                                textAlign: TextAlign.center,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("35.00 USD",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              )
                            ])),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          premiumPlanColor = Color.fromARGB(255, 150, 150, 150);
                          basicPlanColor = GlobalVariables.whiteColor;
                          standardPlanColor = GlobalVariables.whiteColor;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: premiumPlanColor,
                              border: Border.all(
                                  width: 3, color: GlobalVariables.primaryColor),
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(25)),
                            ),
                            child: Column(children: [
                              const Text("Plan Premium"),
                              IconButton(
                                iconSize: 45,
                                onPressed: () {},
                                icon: Image.network(
                                  GlobalVariables.goldKey,
                                ),
                              ),
                              const Text(
                                "Publicar 50 servicios",
                                textAlign: TextAlign.center,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("45.00 USD",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              )
                            ])),
                      ),
                    )
                  ]),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          "*El pago se realizara de forma automatica, puede cancelar en cualquier momento",
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  sizedBox(),
                  newSubHeading('Metodo de pago'),
                  sizedBox(),
                  cardNumber(),
                  sizedBox(),
                  cardholderName(),
                  sizedBox(),
                  cardInformation(context),
                  sizedBox(),
                  sizedBox(),
                  sizedBox(),
                  sizedBox(),
                  payButton(context)
                ],
              ))
        ],
      )),
    );
  }
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

SizedBox sizedBox() => const SizedBox(height: 15);

Container cardNumber() {
  var cardMask = MaskTextInputFormatter(
      mask: '####-####-####-####', filter: {"#": RegExp(r'[0-9]')});

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
        child: TextFormField(
            inputFormatters: [cardMask],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Número de tarjeta crédito/débito"))),
  );
}

Container cardholderName() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
        child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Nombre del titular de la tarjeta"))),
  );
}

Row cardInformation(BuildContext context) {
  return Row(
    children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.45, child: _dueDate()),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.45, child: _cvcCvv()),
    ],
  );
}

Container _dueDate() {
  var dueDateMask =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
        child: TextFormField(
            inputFormatters: [dueDateMask],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "MM/AA"),
            textAlign: TextAlign.center)),
  );
}

Container _cvcCvv() {
  var cvcMask =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
        child: TextFormField(
            inputFormatters: [cvcMask],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "CVC/CVV"),
            textAlign: TextAlign.center)),
  );
}

Container payButton(BuildContext context) {
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
                  content: const Text("Servicio contratado exitosamente"),
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
              borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
            ),
          ),
        ),
        child: const Text(
          "Pagar",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ));
}
