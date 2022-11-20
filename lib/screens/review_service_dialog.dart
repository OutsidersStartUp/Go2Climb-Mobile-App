import 'package:flutter/material.dart';
import 'package:go2climb/models/customer.dart';
import 'package:go2climb/models/service_reviews.dart';
import 'package:go2climb/models/service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/global_variables.dart';

class ReviewServiceDialog{
  final txtScore = TextEditingController();
  final txtComment = TextEditingController();

  Future<void> reviewService(ServiceReviews serviceReviews, BuildContext context) async {
    var response = await http.post(
        Uri.parse(
            '${GlobalVariables.url}api/v1/servicereviews'
        ),
        body: serviceReviews.toJson(),
        headers: { "Content-Type" : "application/json"}
    );

    if (response.statusCode == 200){
      Navigator.pop(context);
    }
  }

  Widget buildDialog(BuildContext context, Service service, int customerId){
    txtScore.text = "";
    txtComment.text = "";
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: Text("Reseña del Servicio"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: txtScore,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Puntaje del servicio (de 0 a 5)"
                ),
                validator: validateScore
              ),
              TextFormField(
                controller: txtComment,
                decoration: const InputDecoration(
                    hintText: "Comentario"
                ),
                validator: validateComment,
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      ServiceReviews newServiceReview = ServiceReviews(
                          serviceId: service.id,
                          customerId: customerId,
                          date: DateTime.now().toString(),
                          comment: txtComment.text,
                          score: int.parse(txtScore.text)
                      );
                      reviewService(newServiceReview, context);
                    }
                  },
                  child: const Text("Continuar"))
            ],
          ),
        ),
      ),
    );
  }

  String? validateScore(String? value){
    int? numberValue = int.parse(value!);
    if (numberValue > 5)
      return 'El puntaje debe ser entre 1 y 5';
    if (numberValue == null)
      return 'Este campo es obligatorio';
    else
      return null;
  }

  String? validateComment(String? value){
    if (value == "")
      return 'Este campo es obligatorio';
    else
      return null;
  }
}