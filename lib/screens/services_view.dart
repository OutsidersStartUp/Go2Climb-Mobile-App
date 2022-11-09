import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go2climb/components/AppBarGo2Climb.dart';
import 'package:go2climb/models/agency.dart';
import 'package:go2climb/models/service.dart';
import 'package:go2climb/screens/service_detail.dart';
import '../constants/global_variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicesView extends StatefulWidget {
  static const String routeName = '/services-view';
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => DayOffersState();
}

class DayOffersState extends State<ServicesView> {
  String currentState = 'Ofertas del día';
  String currentCategory = 'offers';
  String endpoint = 'api/v1/services';
  String agencyEndpoint = 'api/v1/agencies';

  List<Service> data = [];
  List<Agency> agencies = [];

  Future<List<Service>> retrieveServices(String category) async{
    data = [];
    var response = await http.get(Uri.parse(
        '${GlobalVariables.url}$endpoint'
    ));
    //var response = await http.get(Uri.parse(
    //    '${GlobalVariables.url}$endpoint/services/category?name=$category&start=0&limit=10'
    //));
    var services = <Service>[];
    if (response.statusCode == 200) {
      var servicesJson = json.decode(response.body);
      for (var serviceJson in servicesJson){
        services.add(Service.fromMap(serviceJson));
      }
      for (var service in services) {
        retrieveAgency(service.agencyId)
            .then((value) {
              setState(() {
                agencies.add(value);
              });
            });
      }
    }
    return services;
  }

  Future<Agency> retrieveAgency(int agencyId) async{
    var response = await http.get(Uri.parse(
        '${GlobalVariables.url}$agencyEndpoint/$agencyId'
    ));
    late Agency agencyResource;
    if (response.statusCode == 200) {
      var agencyJson = json.decode(response.body);
      agencyResource = Agency.fromMap(agencyJson);
    }
    return agencyResource;
  }

  @override
  void initState(){
    retrieveServices(currentCategory)
    .then((value) {
      setState(() {
        data.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: const AppBarGo2Climb(),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (currentState != 'Ofertas del día'){
                              setState(() {
                                currentCategory = 'offers';
                                currentState = 'Ofertas del día';
                                retrieveServices(currentCategory);
                                print(data);
                              });
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll<Size>(
                                Size(90, 40)),
                            backgroundColor:
                            const MaterialStatePropertyAll<Color>(
                                Colors.grey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    GlobalVariables.borderRadius),
                              ),
                            ),
                          ),
                          child: const Text("Ofertas del día"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (currentState != 'Los más populares'){
                              setState(() {
                                currentCategory = 'populars';
                                currentState = 'Los más populares';
                                retrieveServices(currentCategory);
                                print(data);
                              });
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll<Size>(
                                Size(90, 40)),
                            backgroundColor:
                            const MaterialStatePropertyAll<Color>(
                                Colors.grey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    GlobalVariables.borderRadius),
                              ),
                            ),
                          ),
                          child: const Text("Los más populares"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (currentState != 'Para ti'){
                              setState(() {
                                currentCategory = 'forYou';
                                currentState = 'Para ti';
                                retrieveServices(currentCategory);
                                print(data);
                              });
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll<Size>(
                                Size(90, 40)),
                            backgroundColor:
                            const MaterialStatePropertyAll<Color>(
                                Colors.grey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    GlobalVariables.borderRadius),
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
                        borderRadius:
                        BorderRadius.circular(GlobalVariables.borderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          currentState,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data == [] ? 0 : data.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            const SizedBox(height: 10.0),
                            serviceCard(context, i),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),);
  }

  GestureDetector serviceCard(BuildContext context, i) {
    String imageUrl = data[i].photos;
    double score = data[i].score.toDouble();
    String title = data[i].name;
    String agency = agencies[i].name;
    double agencyScore = agencies[i].score.toDouble();
    String price = 'S/${data[i].price}.00';
    String offer = 'S/${data[i].newPrice}.00';

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ServiceDetail(data[i], agency)));
      },
      child: Container(
          //height: 320,
          constraints: BoxConstraints(
              maxHeight: double.infinity
          ),
          decoration: BoxDecoration(
              color: GlobalVariables.whiteColor,
              borderRadius:
                  BorderRadius.circular(GlobalVariables.borderRadius)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(GlobalVariables.borderRadius),
                      child: Image.network(imageUrl, height: 190)),
                ),
                const SizedBox(height: 10.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('por: '),
                        Text(
                          agency,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 15.0),
                        RatingBar.builder(
                          initialRating: agencyScore,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          ignoreGestures: true,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 5.0),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 15.0),
                        Text(
                          offer,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
