import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Agency {
  final int id;
  final String name;
  final String email;
  final int phoneNumber;
  final String description;
  final String location;
  final int ruc;
  final String photo;
  final double score;
  Agency({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.description,
    required this.location,
    required this.ruc,
    required this.photo,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as int,
      description: map['description'] as String,
      location: map['location'] as String,
      ruc: map['ruc'] as int,
      photo: map['photo'] as String,
      score: map['score'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Agency.fromJson(String source) =>
      Agency.fromMap(json.decode(source) as Map<String, dynamic>);
}
