// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:go2climb/models/agency.dart';

class Service {
  final int id;
  final String name;
  final double score;
  final double price;
  final double newPrice;
  final String location;
  final DateTime creationDate;
  final String photos;
  final String description;
  final bool isOffer;
  final Agency agency;
  Service({
    required this.id,
    required this.name,
    required this.score,
    required this.price,
    required this.newPrice,
    required this.location,
    required this.creationDate,
    required this.photos,
    required this.description,
    required this.isOffer,
    required this.agency,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'score': score,
      'price': price,
      'newPrice': newPrice,
      'location': location,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'photos': photos,
      'description': description,
      'isOffer': isOffer,
      'agency': agency.toMap(),
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] as int,
      name: map['name'] as String,
      score: map['score'] as double,
      price: map['price'] as double,
      newPrice: map['newPrice'] as double,
      location: map['location'] as String,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      photos: map['photos'] as String,
      description: map['description'] as String,
      isOffer: map['isOffer'] as bool,
      agency: Agency.fromMap(map['agency'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);
}
