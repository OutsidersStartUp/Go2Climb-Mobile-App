import 'package:flutter/material.dart';
import 'package:go2climb/constants/global_variables.dart';

class Mountains extends StatelessWidget {
  const Mountains({super.key});

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
          child: Container(
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
