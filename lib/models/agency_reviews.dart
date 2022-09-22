// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:go2climb/models/agency.dart';
import 'package:go2climb/models/customer.dart';

class AgencyReviews {
  final int id;
  final DateTime date;
  final String comment;
  final double professionalismScore;
  final double securityScore;
  final double qualityScore;
  final double costScore;
  final Agency agency;
  final Customer customer;
  AgencyReviews({
    required this.id,
    required this.date,
    required this.comment,
    required this.professionalismScore,
    required this.securityScore,
    required this.qualityScore,
    required this.costScore,
    required this.agency,
    required this.customer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'comment': comment,
      'professionalismScore': professionalismScore,
      'securityScore': securityScore,
      'qualityScore': qualityScore,
      'costScore': costScore,
      'agency': agency.toMap(),
      'customer': customer.toMap(),
    };
  }

  factory AgencyReviews.fromMap(Map<String, dynamic> map) {
    return AgencyReviews(
      id: map['id'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      comment: map['comment'] as String,
      professionalismScore: map['professionalismScore'] as double,
      securityScore: map['securityScore'] as double,
      qualityScore: map['qualityScore'] as double,
      costScore: map['costScore'] as double,
      agency: Agency.fromMap(map['agency'] as Map<String, dynamic>),
      customer: Customer.fromMap(map['customer'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyReviews.fromJson(String source) =>
      AgencyReviews.fromMap(json.decode(source) as Map<String, dynamic>);
}
