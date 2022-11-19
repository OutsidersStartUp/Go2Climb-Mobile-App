import 'dart:convert';
import 'package:go2climb/models/customer.dart';
import 'package:go2climb/models/service.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceReviews {
  final int? id;
  final int serviceId;
  final int customerId;
  final String date;
  final String comment;
  final int score;
  final Service? service;
  final Customer? customer;
  ServiceReviews({
    this.id,
    required this.serviceId,
    required this.customerId,
    required this.date,
    required this.comment,
    required this.score,
    this.service,
    this.customer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'serviceId': serviceId,
      'customerId': customerId,
      'date': date,
      'comment': comment,
      'score': score,
    };
  }

  factory ServiceReviews.fromMap(Map<String, dynamic> map) {
    return ServiceReviews(
        id: map['id'] == null ? null : map['id'] as int,
        serviceId: map['serviceId'] as int,
        customerId: map['serviceId'] as int,
        date: map['date'] as String,
        comment: map['comment'] as String,
        score: map['score'] as int,
        service: map['service'] == null ? null : Service.fromMap(map['service'] as Map<String, dynamic>),
        customer: map['customer'] == null ? null : Customer.fromMap(map['customer'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceReviews.fromJson(String source) =>
      ServiceReviews.fromMap(json.decode(source) as Map<String, dynamic>);
}
