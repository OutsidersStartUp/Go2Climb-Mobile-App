// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:go2climb/models/customer.dart';
import 'package:go2climb/models/service.dart';

class HiredServices {
  final int id;
  final int amount;
  final double price;
  final DateTime scheduledDate;
  final int status;
  final Customer customer;
  final Service service;
  HiredServices({
    required this.id,
    required this.amount,
    required this.price,
    required this.scheduledDate,
    required this.status,
    required this.customer,
    required this.service,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'price': price,
      'scheduledDate': scheduledDate.millisecondsSinceEpoch,
      'status': status,
      'customer': customer.toMap(),
      'service': service.toMap(),
    };
  }

  factory HiredServices.fromMap(Map<String, dynamic> map) {
    return HiredServices(
      id: map['id'] as int,
      amount: map['amount'] as int,
      price: map['price'] as double,
      scheduledDate:
          DateTime.fromMillisecondsSinceEpoch(map['scheduledDate'] as int),
      status: map['status'] as int,
      customer: Customer.fromMap(map['customer'] as Map<String, dynamic>),
      service: Service.fromMap(map['service'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory HiredServices.fromJson(String source) =>
      HiredServices.fromMap(json.decode(source) as Map<String, dynamic>);
}
