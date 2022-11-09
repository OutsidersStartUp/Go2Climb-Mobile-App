import 'dart:convert';
import 'package:equatable/equatable.dart';

class Agency extends Equatable {
  const Agency({

    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.description,
    required this.location,
    required this.ruc,
    required this.photo,
    required this.score,
  });
  final String name;
  final String email;
  final String phoneNumber;
  final String description;
  final String location;
  final String ruc;
  final String photo;
  final int score;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'description': description,
      'location': location,
      'ruc': ruc,
      'photo': photo,
      'score': score,
    };
  }

  factory Agency.fromMap(Map<String, dynamic> map) {
    return Agency(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      ruc: map['ruc'] as String,
      photo: map['photo'] as String,
      score: map['score'] as int,
    );
  }

  @override
  List<Object?> get props =>
      [name, email, phoneNumber, description, location, ruc, photo, score];
}
