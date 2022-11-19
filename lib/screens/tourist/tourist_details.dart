import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/models/customer.dart';
import '../../models/hired_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TouristDetails extends StatefulWidget {
  const TouristDetails({
    super.key,
    required this.tourist,
  });
  final Customer tourist;

  @override
  State<TouristDetails> createState() => _TouristDetailsState(tourist);
}

class _TouristDetailsState extends State<TouristDetails> {
  final Customer tourist;
  final String country = 'Perú';
  List<HiredServices> hiredServices = [];

  _TouristDetailsState(this.tourist);

  Future<List<HiredServices>> retrieveHiredServices() async{
    //TODO: Change Customer Id
    var response = await http.get(Uri.parse(
        '${GlobalVariables.url}api/v1/customers/1/hiredservices/information?expand=service'
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: GlobalVariables.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.network(tourist.photo),
                                iconSize: 140,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tourist.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                            tourist.email
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                      child: Row(
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Teléfono",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  tourist.phoneNumber,
                                                  style: const TextStyle(
                                                      fontStyle: FontStyle.italic
                                                  ),
                                                ),
                                              ]),
                                          const SizedBox(width: 15),
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "País",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                  country,
                                                  style: const TextStyle(
                                                      fontStyle: FontStyle.italic
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: 180,
                            child: ElevatedButton(
                              onPressed: () {
                              },
                              style: ButtonStyle(
                                minimumSize: const MaterialStatePropertyAll<Size>(
                                    Size(double.infinity, 40)),
                                backgroundColor:
                                const MaterialStatePropertyAll<Color>(GlobalVariables.primaryColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Editar información",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),),
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: GlobalVariables.whiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20.0, top: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Servicios contratados",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ]),
                      ),
                      const SizedBox(height: 20),

                      ListView.builder(
                          itemCount: hiredServices.isEmpty ? 1 : hiredServices.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return hiredServices.isEmpty
                                ? const Text(
                              "Usted aún no cuenta con servicios contratados, descubre Go2Climb y empieza el viaje de tu vida.",
                              textAlign: TextAlign.center,
                                  )
                                : Column(
                                    children: [
                                      const SizedBox(height: 10.0),
                                      HiredService(hiredServices[i]),
                                    ],
                                  );
                          }),


                      const SizedBox(height: 20)
                    ]
                ),
              )
            ],
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
  String service = "";
  String date = "";
  String price = "";
  String status = "";

  _HiredServiceState(this.hiredService){
    service = hiredService.service!.name;
    date = hiredService.scheduledDate;
    price = hiredService.price.toString();
    status = hiredService.status;
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
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      color: GlobalVariables.primaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(GlobalVariables.borderRadius)),
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: const Text("Información general",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(GlobalVariables.borderRadius)),
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text(""),
                        const Text("Fecha del servicio"),
                        Text(date),
                        const Text(""),
                        const Text("Importe total"),
                        Text("S/$price.00"),
                      ],
                    ),
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
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      color: GlobalVariables.primaryColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: const Text("Estado del servicio",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                    ),
                    margin: EdgeInsets.only(bottom: 2.5),
                    padding: EdgeInsets.all(10.0),
                    child: Text(status),
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
                    constraints: const BoxConstraints.expand(),
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
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(GlobalVariables.borderRadius)),
                    ),
                    margin: const EdgeInsets.only(bottom: 2.5),
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (status != 'pending'){
                          //TODO: Review Service
                        }
                      },
                      style: ButtonStyle(
                        maximumSize: const MaterialStatePropertyAll<Size>(
                            Size(70, 40)),
                        backgroundColor:
                        MaterialStatePropertyAll<Color>(
                            status != 'pending' ? GlobalVariables.primaryColor : Colors.grey),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                GlobalVariables.borderRadius),
                          ),
                        ),
                      ),
                      child: Text(
                        "Calificar servicio",
                        style: TextStyle(color: status != 'pending' ? Colors.black : Colors.white),
                      ),
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