import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go2climb/screens/service_detail.dart';
import '../constants/global_variables.dart';
import 'agency_profile.dart';

class ServicesView extends StatefulWidget {
  static const String routeName = '/services-view';
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => DayOffersState();
}

class DayOffersState extends State<ServicesView> {
  String currentState = 'Ofertas del día';

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
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //TODO: Implement change state
                        },
                        style: ButtonStyle(
                          minimumSize: const MaterialStatePropertyAll<Size>(
                              Size(90, 40)),
                          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
                            ),
                          ),
                        ),
                        child: const Text("Ofertas del día"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          //TODO: Implement change state
                        },
                        style: ButtonStyle(
                          minimumSize: const MaterialStatePropertyAll<Size>(
                              Size(90, 40)),
                          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
                            ),
                          ),
                        ),
                        child: const Text("Los más populares"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          //TODO: Implement change state
                        },
                        style: ButtonStyle(
                          minimumSize: const MaterialStatePropertyAll<Size>(
                              Size(90, 40)),
                          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.grey),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
                            ),
                          ),
                        ),
                        child: const Text("Para ti"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.0),

                  //Current State
                  Container(
                    alignment: Alignment.topLeft,
                    height: 40,
                    decoration: BoxDecoration(
                      color: GlobalVariables.whiteColor,
                      borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(currentState,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),

                  const SizedBox(height: 10.0),
                  // Service cards
                  serviceCard(context, GlobalVariables.mountain1),

                  const SizedBox(height: 10.0),
                  // Service cards
                  serviceCard(context, GlobalVariables.mountain2),

                  const SizedBox(height: 10.0),
                  // Service cards
                  serviceCard(context, GlobalVariables.mountain3),

                  const SizedBox(height: 10.0),
                  // Service cards
                  serviceCard(context, GlobalVariables.mountain1),
                ],
              )

          ),
        ),
      )

    );
  }

  GestureDetector serviceCard(BuildContext context, imageUrl){
    String title = 'Disfruta de una aventura en la montaña el Huascarán';
    String agency = 'TravelNew';
    String price = 'S/500.00';
    String offer = 'S/480.00';

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ServiceDetail.routeName);
      },
      child: Container(
          height: 320,
          decoration: BoxDecoration(
              color: GlobalVariables.whiteColor,
              borderRadius: BorderRadius.circular(GlobalVariables.borderRadius)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(GlobalVariables.borderRadius),
                      child: Image.network(imageUrl, height: 190)
                  ),
                ),

                const SizedBox(height: 10.0),

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

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(title,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                const SizedBox(height: 5.0),

                Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('por: '),
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
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
      ),
    );
  }
}