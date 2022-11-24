import 'package:flutter/material.dart';
import 'package:go2climb/components/AppBarGo2Climb.dart';
import '../constants/global_variables.dart';
import '../models/hired_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MonitorClients extends StatefulWidget {
  static const String routeName = '/monitor-clients';

  @override
  State<MonitorClients> createState() => _MonitorClientsState();
}

class _MonitorClientsState extends State<MonitorClients> {
  List<HiredServices> hiredServices = [];

  Future<List<HiredServices>> retrieveHiredServices() async{
    //TODO: Change Agency Id
    var response = await http.get(Uri.parse(
        '${GlobalVariables.url}api/v1/agencies/1/hiredservices?expand=true'
    ));
    var _hiredServices = <HiredServices>[];
    if (response.statusCode == 200){
      var hiredServicesJson = json.decode(response.body);
      for (var hiredServiceJson in hiredServicesJson){
        _hiredServices.add(HiredServices.fromMap(hiredServiceJson));
      }
    }
    return _hiredServices;
  }

  @override
  void initState(){
    retrieveHiredServices()
        .then((value) {
      setState(() {
        hiredServices.addAll(value);
      });
    });
    super.initState();
  }

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

                          ListView.builder(
                              itemCount: hiredServices == [] ? 0 : hiredServices.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 10.0),
                                    HiredService(hiredServices[i]),
                                  ],
                                );
                              })
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
  late HiredServices hiredService;

  HiredService(this.hiredService);

  @override
  State<HiredService> createState() => _HiredServiceState(hiredService);
}

class _HiredServiceState extends State<HiredService> {
  HiredServices hiredService;
  String name = "";
  String email = "";
  String phone = "";
  String amount = "";
  String service = "";
  String date = "";
  String price = "";
  String status = "";

  _HiredServiceState(this.hiredService){
    name = hiredService.customer!.name;
    email = hiredService.customer!.email;
    phone = hiredService.customer!.phoneNumber;
    amount = hiredService.amount.toString();
    service = hiredService.service!.name;
    date = hiredService.scheduledDate;
    price = hiredService.price.toString();
    status = hiredService.status;
  }

  String dropdownvalue = 'pending';
  var items = [
    'pending',
    'active',
    'finished',
  ];

  Future<HiredServices> updateHiredService(HiredServices hiredServiceData) async {
    var response = await http.put(
        Uri.parse(
            '${GlobalVariables.url}api/v1/hiredservice/${hiredService.id}'
        ),
        body: hiredServiceData.toJson(),
        headers: { "Content-Type" : "application/json"}
    );
    HiredServices updatedHiredService;
    if (response.statusCode == 200){
      var hiredServiceJson = json.decode(response.body);
      updatedHiredService = HiredServices.fromMap(hiredServiceJson);

      return updatedHiredService;
    }
    else{
      return hiredServiceData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(GlobalVariables.borderRadius)),
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(name),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(email),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(phone),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(amount),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(service),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(date),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
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
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text("S/${price}.00"),
                  ),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: GlobalVariables.primaryColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(GlobalVariables.borderRadius)),
                    ),
                    margin: const EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: const Text("Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(GlobalVariables.borderRadius)),
                    ),
                    margin: const EdgeInsets.only(bottom: 2.5),
                    padding: const EdgeInsets.only(left: 10.0),
                    child: DropdownButton(
                      value: status,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: const TextStyle(fontSize: 14),),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        HiredServices newHiredService = HiredServices(
                            id: hiredService.id,
                            customerId: hiredService.customerId,
                            serviceId: hiredService.serviceId,
                            amount: hiredService.amount,
                            price: hiredService.price,
                            scheduledDate: hiredService.scheduledDate,
                            status: newValue!
                        );
                        updateHiredService(newHiredService)
                            .then((value) {
                          setState(() {
                            amount = value.amount.toString();
                            date = value.scheduledDate;
                            price = value.price.toString();
                            status = value.status;
                          });
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
