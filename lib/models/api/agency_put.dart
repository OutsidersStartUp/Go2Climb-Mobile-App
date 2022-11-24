import 'package:equatable/equatable.dart';

class AgencyPut extends Equatable {
  const AgencyPut({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.description,
    required this.location,
    required this.ruc,
    required this.photo,
    required this.score,
  });
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String description;
  final String location;
  final String ruc;
  final String photo;
  final int score;

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        password,
        phoneNumber,
        description,
        location,
        ruc,
        photo,
        score
      ];
}
