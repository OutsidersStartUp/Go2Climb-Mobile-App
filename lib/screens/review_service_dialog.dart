import 'package:flutter/material.dart';
import 'package:go2climb/models/customer.dart';
import 'package:go2climb/models/service_reviews.dart';
import 'package:go2climb/models/service.dart';

class ReviewServiceDialog{
  final txtScore = TextEditingController();
  final txtComment = TextEditingController();

  Widget buildDialog(BuildContext context, Service service, int customerId){
    txtScore.text = "";
    txtComment.text = "";

    return AlertDialog(
      title: Text("Reseña del Servicio"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtScore,
              decoration: const InputDecoration(
                hintText: "Puntaje del servicio (de 0 a 5)"
              ),
            ),
            TextField(
              controller: txtComment,
              decoration: const InputDecoration(
                  hintText: "Comentario"
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  if(txtScore.text != "" && txtComment.text != ""){
                    ServiceReviews newServiceReview = ServiceReviews(
                        serviceId: service.id,
                        customerId: customerId,
                        date: DateTime.now().toString(),
                        comment: txtComment.text,
                        score: int.parse(txtScore.text)
                    );
                    //TODO: POST REVIEW
                  }
                },
                child: const Text("Continuar"))
          ],
        ),
      ),
    )
  }
}