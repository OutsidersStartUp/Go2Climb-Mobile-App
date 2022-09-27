import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/global_variables.dart';
import 'agency_profile.dart';

class ServiceDetail extends StatelessWidget {
  static const String routeName = '/service-detail';
  ServiceDetail({super.key});

  String imageUrl = GlobalVariables.mountain1;
  String title = 'Disfruta de una aventura en la montaña el Huascarán';
  String agency = 'agencia TravelNew';
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                  height: 620,
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

                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(height: 10.0),

                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                              const SizedBox(height: 5.0),

                              //TODO: In Progress
                              Row(children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.blue,
                                ),
                                Text("Maicena, Lima - Perú")
                              ]),

                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('por: '),
                                      Text(agency,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      const SizedBox(width: 15.0),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  )
                              ),
                              const SizedBox(height: 5.0),

                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(price,
                                        style: const TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),

                                      ),
                                      const SizedBox(width: 15.0),
                                      Text(offer,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        )
                      ]
                  )
              ),
            ]
          )
        )
      ),
    );
  }
}