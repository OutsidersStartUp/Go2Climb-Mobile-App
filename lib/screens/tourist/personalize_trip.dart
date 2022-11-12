import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/models/create_hired_services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;

import '../../models/service.dart';
import '../services_view.dart';

class PersonalizeTrip extends StatefulWidget {
  static const String routeName = '/personalize-trip';
  final Service service;
  final String agencyName;

  PersonalizeTrip(this.service, this.agencyName);

  @override
  State<PersonalizeTrip> createState() => _PersonalizeTripState(service, agencyName);
}

class _PersonalizeTripState extends State<PersonalizeTrip> {
  final urlAPI = Uri.parse("${GlobalVariables.url}api/v1/hiredservice");
  final headers = {"Content-Type" : "application/json"};
  late Future<CreateHiredServices> createHiredServices;

  final Service service;
  final String agencyName;
  late String imageUrl;
  late String title;
  late String agency;
  late int serviceId; //late? :v

  int customerId = 1;
  String status = "pending"; //default

  _PersonalizeTripState(this.service, this.agencyName){
    imageUrl = service.photos;
    title = service.name;
    agency = agencyName;
    serviceId = service.id;
  }

  final scheduledDate = TextEditingController();
  final amount = TextEditingController();
  final price = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        title: const Text("Pagar Servicio"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
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
                              newSubtitle("Servicio seleccionado"),
                              sizedBox(),
                              serviceImage(),
                              sizedBox(),
                              newSubtitle(title),
                              sizedBox(),
                              Row(
                                children: [
                                  const Text("Ofrecido por "),
                                  Text(
                                    agency,
                                    style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              sizedBox(),
                              personalizeFields(context),
                              sizedBox(),
                              priceForm(),
                              sizedBox(),
                              newSubtitle("Método de pago"),
                              sizedBox(),
                              cardNumber(),
                              sizedBox(),
                              cardholderName(),
                              sizedBox(),
                              cardInformation(context),
                              sizedBox(),
                              payButton(context)]
                          )
                      )
                    ]
                )
            )
          ]
        )
      )
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
                    saveHiredService();
                    Navigator.pushNamed(
                      context, ServicesView.routeName);
                  },
                )
              ],
            )),
          );
        },
      style: ButtonStyle(
        minimumSize: 
        const MaterialStatePropertyAll<Size>(
          Size(double.infinity, 40)),
        backgroundColor:
        const MaterialStatePropertyAll<Color>(
          GlobalVariables.primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                GlobalVariables.borderRadius
              ),
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
      )
    );
  }

  Container serviceImage() {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
        child: Image.network(
          imageUrl, 
          height: 165)
      ),
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

  Row personalizeFields(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: _travelDate()),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4, 
            child: _numberOfPeople()),
      ],
    );
  }

  Container _travelDate() {  
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        keyboardType: TextInputType.number,
        controller: scheduledDate,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          border: InputBorder.none, hintText: "Salida"
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate:DateTime(2022),
              lastDate: DateTime(2024)
            );
            if(pickedDate != null){
              String formattedDate = DateFormat.yMd().format(pickedDate);
              setState(() {
                scheduledDate.text = formattedDate;
              });
            }
          },
      )),
    );
  }

  Container _numberOfPeople() {
    var numberOfPeopleMask = MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [numberOfPeopleMask],
        keyboardType: TextInputType.number,
        controller: amount,
        decoration: const InputDecoration(
          border: InputBorder.none, hintText: "# Personas"),
          textAlign: TextAlign.center
      )),
    );
  }

  Container priceForm() {
    var priceMask = MaskTextInputFormatter(
        mask: '#####', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          child: TextFormField(
        inputFormatters: [priceMask],
        keyboardType: TextInputType.number,
        controller: price,
        decoration: const InputDecoration(
          border: InputBorder.none, 
          hintText: "Total importe (S/.)"),
          textAlign: TextAlign.center
      )),
    );
  }

  Container cardNumber() {
    var cardMask = MaskTextInputFormatter(
        mask: '####-####-####-####', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: GlobalVariables.primaryColor, width: 3)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
  
  void saveHiredService() async {
    final newHiredService = {
      "scheduledDate": scheduledDate.text,
      "amount": amount.text,
      "price": price.text,
      "customerId": customerId, 
      "serviceId": serviceId,
      "status": status
    };

    await http.post(urlAPI, headers: headers, body: jsonEncode(newHiredService));
    scheduledDate.clear();
    amount.clear();
    price.clear();
  }
}