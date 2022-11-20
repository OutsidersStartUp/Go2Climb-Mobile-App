// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/models/agency.dart';
import 'package:go2climb/screens/agency/agency_profile_edit.dart';
import 'package:go2climb/screens/create_agency_service.dart';

class AgencyDetails extends StatelessWidget {
  const AgencyDetails({
    super.key,
    required this.agency,
  });

  final Agency agency;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                color: GlobalVariables.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              //Agency Description
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: GlobalVariables.primaryColor,
                              width: 1.0, // Underline thickness
                            ))),
                            padding: const EdgeInsets.only(left: 30, top: 30),
                            child: Text(
                              agency.name,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 110.0, top: 25),
                            child: Row(children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              Text('80', style: TextStyle(fontSize: 20)),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              )
                            ]),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, top: 50.0),
                        child: Text(agency.email),
                      ),
                    ],
                  ),
                  //Left Icon
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.network(agency.photo),
                              iconSize: 140,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "RUC",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(agency.ruc),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Teléfono",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(agency.phoneNumber),
                              ],
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      child: Text(
                        agency.description,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  GlobalVariables.buttonColor)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AgencyProfileEdit(agency: agency)));
                          },
                          child: Text("Editar información"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10),
                        child: Row(children: [
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                          ),
                          Text(agency.location)
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: GlobalVariables.whiteColor,
                  borderRadius: BorderRadius.circular(10.0)),
              //------------------------------------Offers Section------------------------------------//
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Servicios"),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, CreateAgencyService.routeName);
                          },
                          child: Icon(Icons.add),
                        ),
                      ]),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Ofertas"),
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll<Size>(
                            Size(double.infinity, 40)),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.grey),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Usted aún no cuenta con servicios registrados, empiece ahora presionando +",
                  textAlign: TextAlign.center,
                )
                /*Imagen del servicio añadido
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: NetworkImage(GlobalVariables.mountain1),
                  ),
                )*/
              ]),
            )
          ],
        ),
      ),
    );
  }
}
