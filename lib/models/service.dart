// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:go2climb/models/agency.dart';

class Service {
  final int id;
  final int agencyId;
  final String name;
  final int score;
  final int price;
  final int newPrice;
  final String location;
  final String creationDate;
  final String photos;
  final String description;
  final bool isOffer;
  Service({
    required this.id,
    required this.agencyId,
    required this.name,
    required this.score,
    required this.price,
    required this.newPrice,
    required this.location,
    required this.creationDate,
    required this.photos,
    required this.description,
    required this.isOffer
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'agencyId': agencyId,
      'name': name,
      'score': score,
      'price': price,
      'newPrice': newPrice,
      'location': location,
      'creationDate': creationDate,
      'photos': photos,
      'description': description,
      'isOffer': isOffer
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] as int,
      agencyId: map['agencyId'] as int,
      name: map['name'] as String,
      score: map['score'] as int,
      price: map['price'] as int,
      newPrice: map['newPrice'] as int,
      location: map['location'] as String,
      creationDate: map['creationDate'] as String,
      photos: map['photos'] as String,
      description: map['description'] as String,
      isOffer: map['isOffer'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);
}
