import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency/agency_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ChangeAgencyPlan extends StatefulWidget {
  static const String routeName = '/change-agency-plan';
  const ChangeAgencyPlan({super.key});

  @override
  State<ChangeAgencyPlan> createState() => _ChangeAgencyPlanState();
}

class _ChangeAgencyPlanState extends State<ChangeAgencyPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        title: const Text("Cambiar plan")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: GlobalVariables.whiteColor,
                borderRadius: BorderRadius.circular(GlobalVariables.borderRadius)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    newSubHeading('Selecciona un plan'),
                    Row(
                      children: [
                        newPlanBox('Basico'),
                        newPlanBox('Premium'),
                        newPlanBox('Estandar'),
                      ]
                    ),
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
                    newSubHeading('Metodo de pago'),
                    sizedBox(),
                    cardNumber(),
                    sizedBox(),
                    cardholderName(),
                    sizedBox(),
                    cardInformation(context),
                  ],
                )
              )
          ],) ),   
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

Container newPlanBox(String name){
  return Container(
    child: Column(
      children: [
        Text("Plan Basico"),
        IconButton(
          iconSize: 45,
          onPressed: () {},
            icon: Image.network(
              GlobalVariables.visaIcon,
            ),
        ),
        Text("Publicar 3 servicios"),
        Text("20 USD")
      ]
    )
    );
}

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
          hintText: "Número de tarjeta crédito/débito")
      )),
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
          hintText: "Nombre del titular de la tarjeta")
      )),
    );
}

Row cardInformation(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _dueDate()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, 
            child: _cvcCvv()),
      ],
    );
}

  Container _dueDate() {
    var dueDateMask = MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
    
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
          textAlign: TextAlign.center
      )),
    );
  }

Container _cvcCvv() {
    var cvcMask = MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

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
          textAlign: TextAlign.center
      )),
    );
  }
