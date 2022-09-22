import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Customer {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final int phoneNumber;
  final String photo;
  Customer({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'photo': photo,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as int,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as int,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source) as Map<String, dynamic>);
}
