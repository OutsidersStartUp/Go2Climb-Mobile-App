import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/create_agency_service.dart';

class AgencyDetails extends StatelessWidget {
  const AgencyDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 320,
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
                        margin: EdgeInsets.only(top: 20),
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.network(GlobalVariables.logo),
                              iconSize: 140,
                            ),
                          ],
                        ),
                      ),
                      //Right Description
                      Container(
                        child: SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TravelNew',
                                    ),
                                    Text('travelnew@gmail.com'),
                                    Wrap(spacing: -18, children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.star_border),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.star_border),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.star_border),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.star_border),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.star_border),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  child: Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("RUC"),
                                        Text("641478521"),
                                      ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Teléfono"),
                                        Text("+51 952364789"),
                                      ]),
                                ],
                              )),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Somos una agencia destinada al alpinismo para principiantes y personas experimentadas. Contamos con más de 20 años de experiencia en el rubro de alpinismo. Agradecemos tu visita.",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Editar información"),
                      ),
                      Row(children: [
                        Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                        Text("Maicena, Lima - Perú")
                      ])
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
