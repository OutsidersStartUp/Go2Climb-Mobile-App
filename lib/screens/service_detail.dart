import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go2climb/models/service_reviews.dart';
import 'package:go2climb/screens/tourist/personalize_trip.dart';
import '../constants/global_variables.dart';
import 'agency/agency_page.dart';
import '../models/activity.dart';
import '../models/service.dart';
import '../models/customer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceDetail extends StatefulWidget {
  static const String routeName = '/service-detail';
  final Service service;
  final String agencyName;

  ServiceDetail(this.service, this.agencyName);

  @override
  State<ServiceDetail> createState() => _ServiceDetailState(service, agencyName);
}

class _ServiceDetailState extends State<ServiceDetail> {
  final Service service;
  final String agencyName;
  late String imageUrl;
  late String title;
  late String location;
  late String agency;
  late String description;
  late String price;
  late double score;

  _ServiceDetailState(this.service, this.agencyName){
    imageUrl = service.photos;
    title = service.name;
    location = service.location;
    agency = agencyName;
    description = service.description;
    price = service.isOffer ? 'S/${service.newPrice}.00' : 'S/${service.price}.00';
    score = service.score.toDouble();
  }
  String isGoodToKnow = "Este servicio atiende a los visitantes de lunes a viernes";
  String time = "desde 10:00 hasta 20:00";

  List<Activity> activities = [];
  List<ServiceReviews> reviews = [];
  //List<Customer> customers = [];

  Future<List<Activity>> retrieveActivities() async{
    var response = await http.get(Uri.parse(
        '${GlobalVariables.url}api/v1/services/${service.id}/activities'
    ));
    var _activities = <Activity>[];
    if (response.statusCode == 200){
      var activitiesJson = json.decode(response.body);
      for (var activityJson in activitiesJson){
        _activities.add(Activity.fromMap(activityJson));
      }
    }
    return _activities;
  }

  Future<List<ServiceReviews>> retrieveReviews() async{
    var response = await http.get(Uri.parse(
        '${GlobalVariables.url}api/v1/services/${service.id}/servicereviews'
    ));
    var _reviews = <ServiceReviews>[];
    if (response.statusCode == 200){
      var reviewsJson = json.decode(response.body);
      for (var reviewJson in reviewsJson){
        _reviews.add(ServiceReviews.fromMap(reviewJson));
      }
    }
    return _reviews;
  }

  @override
  void initState(){
    retrieveActivities()
        .then((value) {
          setState(() {
            activities.addAll(value);
          });
        });
    retrieveReviews()
        .then((value) {
      setState(() {
        reviews.addAll(value);
      });
    });
    super.initState();
  }

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
                                      //Navigator.pushNamed(context, AgencyProfile.routeName);
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
          physics: ScrollPhysics(),
          child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  color: GlobalVariables.whiteColor,
                                  borderRadius: BorderRadiusDirectional
                                      .only(bottomEnd: Radius.circular(GlobalVariables.borderRadius),
                                      bottomStart: Radius.circular(GlobalVariables.borderRadius))
                              ),
                              child: Column(
                                  children: [
                                    // Image
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
                                            initialRating: score,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemCount: 5,
                                            itemSize: 20,
                                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            ignoreGestures: true,
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          const SizedBox(height: 10.0),

                                          // Title
                                          Text(title,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),

                                          //Circles
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.circle,
                                                      color: Colors.blue,
                                                    ),
                                                    Text(' $location',
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
                                            child: Text(description,
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
                                          const Text("Las actividades que realizar??s",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),

                                          ListView.builder(
                                            shrinkWrap: true,
                                              itemCount: activities.isEmpty ? 1 : activities.length,
                                              itemBuilder: (context, i){
                                                return activities.isEmpty
                                                    ? Text("No se han especificado actividades para este servicio")
                                                    : activityWidget(i);
                                              }
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

                          const SizedBox(height: 10.0),
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
                                      Text(price,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (BuildContext context) => PersonalizeTrip(service, agency)));
                                        },
                                        child: const Text("Solicitar"),
                                      ),
                                    ]
                                )
                            ),),

                          const SizedBox(height: 10.0),
                          Container(
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
                                          const Text("Rese??as de este servicio",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),

                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: reviews.isEmpty ? 1 : reviews.length,
                                              itemBuilder: (context, i){
                                                return reviews.isEmpty
                                                    ? Text("Este servicio a??n no tiene rese??as")
                                                    : reviewWidget(i);
                                              }
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

              ]
          ),
        )
    );
  }

  reviewWidget(i) {
    String customerName = reviews[i].customer!.name;
    double score = reviews[i].score.toDouble();
    String comment = reviews[i].comment;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Expanded(
              flex: 0,
              child: Icon(
                Icons.circle,
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(customerName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.justify,),
                  Container(
                    child: Text(
                      comment,
                      textAlign: TextAlign.justify,),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(score.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.justify,),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 1,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      ignoreGestures: true,
                      onRatingUpdate: (rating) {
                      },
                    ),
                  ],
                )
            )
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  activityWidget(i) {
    String activityName = activities[i].name;
    String activityDescription = activities[i].description;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Expanded(
              flex: 0,
              child: Icon(
                Icons.circle,
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activityName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.justify,),
                  Container(
                    child: Text(
                      activityDescription,
                      textAlign: TextAlign.justify,),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}