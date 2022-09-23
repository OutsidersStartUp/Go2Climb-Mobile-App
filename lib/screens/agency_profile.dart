import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/create_agency_service.dart';

class AgencyProfile extends StatelessWidget {
  static const String routeName = '/agency-profile';

  const AgencyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        flexibleSpace: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return SizedBox(
                width: 10.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 2.5),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 100),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: GlobalVariables.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.antiAlias,
                              children: [
                                IconButton(
                                  iconSize: 20,
                                  onPressed: () {},
                                  icon: Image.network(
                                    GlobalVariables.user,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.menu),
                              onPressed: () {},
                              color: GlobalVariables.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: SafeArea(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                    SizedBox(
                      child: Text(
                          "Somos una agencia destinada al alpinismo para principiantes y personas experimentadas. Contamos con más de 20 años de experiencia en el rubro de alpinismo. Agradecemos tu visita."),
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
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      );

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }
}
