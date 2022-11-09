import 'package:flutter/material.dart';
import 'package:go2climb/components/AppBarGo2Climb.dart';
import 'package:go2climb/constants/global_variables.dart';

class TouristProfile extends StatelessWidget {
  static const String routeName = '/tourist-profile';
  TouristProfile({super.key});

  final String touristName = 'Juan Perez';
  final String email = 'juan.perez@gmail.com';
  final String phoneNumber = '+51 952364789';
  final String country = 'Perú';

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: const AppBarGo2Climb(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: GlobalVariables.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                //Agency Description
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Left Icon
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.network(GlobalVariables.user),
                                iconSize: 140,
                              ),
                            ],
                          ),
                        ),
                        //Right Description
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
                                      touristName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      email
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
                                              phoneNumber,
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
                  const Text(
                    "Usted aún no cuenta con servicios contratados, descubre Go2Climb y empieza el viaje de tu vida.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
