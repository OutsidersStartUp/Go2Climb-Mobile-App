import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Agency {
  final String name;
  final String email;
  final String phoneNumber;
  final String description;
  final String location;
  final String ruc;
  final String photo;
  final int score;
  Agency({
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

  String toJson() => json.encode(toMap());

  factory Agency.fromJson(String source) =>
      Agency.fromMap(json.decode(source) as Map<String, dynamic>);
}
