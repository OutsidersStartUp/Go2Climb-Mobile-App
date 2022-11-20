// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:go2climb/components/AppBarGo2Climb.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/models/agency.dart';
import 'package:go2climb/models/api/agency_put.dart';
import 'package:http/http.dart' as http;

var id = 1;
final url = Uri.https(
  'go2climb.azurewebsites.net',
  '/api/v1/agencies/$id',
);

class AgencyProfileEdit extends StatefulWidget {
  static const String routeName = '/agency-profile-edit';

  const AgencyProfileEdit({
    Key? key,
    required this.agency,
  }) : super(key: key);

  final Agency agency;

  @override
  State<AgencyProfileEdit> createState() => _AgencyProfileEditState();
}

class _AgencyProfileEditState extends State<AgencyProfileEdit> {
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerRUC;
  late TextEditingController _controllerPhoneNumber;
  late TextEditingController _controllerDescription;
  late TextEditingController _controllerLocation;

  void initState() {
    super.initState();
    _controllerEmail = new TextEditingController(text: widget.agency.email);
    _controllerRUC = new TextEditingController(text: widget.agency.ruc);
    _controllerPhoneNumber =
        new TextEditingController(text: widget.agency.phoneNumber);
    _controllerDescription =
        new TextEditingController(text: widget.agency.description);
    _controllerLocation =
        new TextEditingController(text: widget.agency.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGo2Climb(),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _controllerRUC,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ruc : ${widget.agency.ruc}',
                  hintText: widget.agency.ruc,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                  controller: _controllerPhoneNumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Teléfono: ${widget.agency.phoneNumber}',
                      hintText: widget.agency.phoneNumber)),
              SizedBox(height: 20),
              TextFormField(
                  controller: _controllerDescription,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description: ${widget.agency.description}',
                      hintText: widget.agency.description)),
              SizedBox(height: 20),
              TextFormField(
                  controller: _controllerLocation,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location: ${widget.agency.location}',
                      hintText: widget.agency.location)),
              Container(
                  child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.red)),
                      onPressed: () {
                        Navigator.pop(context);
                        //updateService();
                      },
                      child: Text("Guardar información"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blue)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Atrás"),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
//------------------The magic is here------------------//
/*
  void updateService() async {
    AgencyPut agency = new AgencyPut(
      name: widget.agency.name,
      email: widget.agency.email,
      password: '',
      phoneNumber: _controllerPhoneNumber.text,
      description: _controllerDescription.text,
      location: _controllerLocation.text,
      ruc: _controllerRUC.text,
      photo: widget.agency.photo,
      score: widget.agency.score,
    );

    await http.put(url,
        headers: {"Content-Type": "application/json"}, body: agency);

    Navigator.pop(context);
  }
  */
}
