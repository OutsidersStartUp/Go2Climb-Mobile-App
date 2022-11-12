import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  const Customer({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.photo,
  });
  final String name;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String photo;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'photo': photo,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      photo: map['photo'] as String,
    );
  }

  @override
  List<Object?> get props =>
      [name, lastName, email, phoneNumber, photo];
}
