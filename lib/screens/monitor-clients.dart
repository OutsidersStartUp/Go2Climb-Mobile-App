import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go2climb/components/AppBarGo2Climb.dart';

import '../constants/global_variables.dart';

class MonitorClients extends StatelessWidget {
  static const String routeName = '/monitor-clients';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: const AppBarGo2Climb(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: const BoxDecoration(
                  color: GlobalVariables.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(GlobalVariables.borderRadius)),
                ),
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hired Services",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            HiredService(),
                            const SizedBox(height: 10.0),
                            HiredService(),


                          ],
                        ),
                      )
                    ]
                )
            ),
        ),
      ),
    );
  }
}

class HiredService extends StatefulWidget {
  const HiredService({Key? key}) : super(key: key);

  @override
  State<HiredService> createState() => _HiredServiceState();
}

class _HiredServiceState extends State<HiredService> {
  String dropdownvalue = 'Pending';
  var items = [
    'Pending',
    'Finished',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(GlobalVariables.borderRadius)),
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(GlobalVariables.borderRadius)),
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Elias Bernat Priego"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("correo@correo.com"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Phone",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("-"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Quantity (people)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("-"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Service",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("-"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Group",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("-"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Departure date",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("-"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Mount",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("-"),
                ),
              ]
          ),
          TableRow(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(GlobalVariables.borderRadius)),
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.all(10.0),
                  child: Text("Status",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(GlobalVariables.borderRadius)),
                  ),
                  margin: EdgeInsets.only(bottom: 2.5),
                  padding: EdgeInsets.only(left: 10.0),
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items, style: TextStyle(fontSize: 14),),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}





