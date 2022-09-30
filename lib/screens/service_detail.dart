import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/global_variables.dart';
import 'agency_profile.dart';

class ServiceDetail extends StatelessWidget {
  static const String routeName = '/service-detail';
  ServiceDetail({super.key});

  String imageUrl = GlobalVariables.mountain1;
  String title = 'Disfruta de una aventura en la montaña el Huascarán';
  String district = 'Pomabamba';
  String department = 'Ancash';

  String activity1 = "Escalada";
  String activityDescription1 = "Con un guía partiremos desde la planta del nevado hasta 100m sobre esta";

  String activity2 = "Toma fotos";
  String activityDescription2 = "En nuestra primera parada a 50m de altura disfruta de la vista y toma fotos del momento";

  String isGoodToKnow = "Este servicio atiende a los visitantes de lunes a viernes";
  String time = "desde 10:00 hasta 20:00";

  String agency = 'TravelNew';
  String price = 'S/500.00';
  String offer = 'S/480.00';

  @override
  Widget build(BuildContext context){
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
                                  onPressed: () {
                                    Navigator.pushNamed(context, AgencyProfile.routeName);
                                  },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Container(
                          height: 460,
                          decoration: const BoxDecoration(
                              color: GlobalVariables.whiteColor,
                              borderRadius: BorderRadiusDirectional
                                  .only(bottomEnd: Radius.circular(GlobalVariables.borderRadius),
                                  bottomStart: Radius.circular(GlobalVariables.borderRadius))
                          ),
                          child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                      child: Image.network(imageUrl, height: 200)
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      const SizedBox(height: 10.0),

                                      Text(title,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),

                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.circle,
                                                  color: Colors.blue,
                                                ),
                                                Text("$district,\n$department",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),)
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.circle,
                                                  color: Colors.blue,
                                                ),
                                                const Text("Ofrecido por "),
                                                Text(agency,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ),)
                                              ],
                                            ),
                                          ]),

                                      const SizedBox(height: 10.0),

                                      Container(
                                        child: const Text('A través de TravelNew disfruta de una aventura inolvidable, escala por la montaña El Huascarán acompañado de un guía en todo momento, ve las mejores vistas y paisajes y sé parte de las pocas personas que lo visiten.',
                                          textAlign: TextAlign.justify,),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          )
                      ),

                      const SizedBox(height: 10.0),
                      Container(
                          height: 200,
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
                                      const Text("Las actividades que realizarás",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.blue,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(activity1,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                textAlign: TextAlign.justify,),
                                              Container(
                                                width: 320,
                                                child: Text(activityDescription1, textAlign: TextAlign.justify,),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color: Colors.blue,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(activity2,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                                textAlign: TextAlign.justify,),
                                              Container(
                                                width: 320,
                                                child: Text(activityDescription2, textAlign: TextAlign.justify,),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          )
                      ),

                      const SizedBox(height: 10.0),
                      Container(
                          height: 120,
                          decoration: const BoxDecoration(
                            color: GlobalVariables.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(GlobalVariables.borderRadius)),
                          ),
                          child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      const Text("Es bueno saberlo",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      const SizedBox(height: 10.0),

                                      Container(
                                        child: Text(isGoodToKnow,
                                          textAlign: TextAlign.justify,),
                                      ),

                                      Container(
                                        child: Text(time,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300, // light
                                          ),),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          )
                      ),
                    ]
                )
            ),
            Container(
              width: 450,
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: GlobalVariables.whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(offer,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Solitar"),
                      ),
                    ]
                )
            ),)

          ]
        ),
      )
    );
  }
}