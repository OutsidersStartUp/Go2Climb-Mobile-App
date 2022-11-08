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
                    )
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