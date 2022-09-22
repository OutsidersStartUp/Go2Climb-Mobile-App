import 'dart:convert';

import 'package:go2climb/models/agency.dart';
import 'package:go2climb/models/customer.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServiceReviews {
  final int id;
  final DateTime date;
  final String comment;
  final double score;
  final Agency agencyId;
  final Customer customerId;
  ServiceReviews({
    required this.id,
    required this.date,
    required this.comment,
    required this.score,
    required this.agencyId,
    required this.customerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'comment': comment,
      'score': score,
      'agencyId': agencyId.toMap(),
      'customerId': customerId.toMap(),
    };
  }

  factory ServiceReviews.fromMap(Map<String, dynamic> map) {
    return ServiceReviews(
      id: map['id'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      comment: map['comment'] as String,
      score: map['score'] as double,
      agencyId: Agency.fromMap(map['agencyId'] as Map<String, dynamic>),
      customerId: Customer.fromMap(map['customerId'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceReviews.fromJson(String source) =>
      ServiceReviews.fromMap(json.decode(source) as Map<String, dynamic>);
}
