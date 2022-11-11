// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:go2climb/models/customer.dart';
import 'package:go2climb/models/service.dart';

class HiredServices {
  final int id;
  final int customerId;
  final int serviceId;
  final int amount;
  final int price;
  final String scheduledDate;
  final String status;
  final Customer? customer;
  final Service? service;
  HiredServices({
    required this.id,
    required this.customerId,
    required this.serviceId,
    required this.amount,
    required this.price,
    required this.scheduledDate,
    required this.status,
    this.customer,
    this.service,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'serviceId': serviceId,
      'amount': amount,
      'price': price,
      'scheduledDate': scheduledDate,
      'status': status,
    };
  }

  factory HiredServices.fromMap(Map<String, dynamic> map) {
    return HiredServices(
      id: map['id'] as int,
      customerId: map['customerId'] as int,
      serviceId: map['serviceId'] as int,
      amount: map['amount'] as int,
      price: map['price'] as int,
      scheduledDate: map['scheduledDate'] as String,
      status: map['status'] as String,
      customer: map['customer'] == null ? null : Customer.fromMap(map['customer'] as Map<String, dynamic>),
      service: map['service'] == null ? null : Service.fromMap(map['service'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory HiredServices.fromJson(String source) =>
      HiredServices.fromMap(json.decode(source) as Map<String, dynamic>);
}
