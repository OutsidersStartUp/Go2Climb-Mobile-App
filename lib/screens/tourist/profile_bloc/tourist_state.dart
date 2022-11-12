part of 'tourist_bloc.dart';

enum TouristStatus { initial, success, failure }

class TouristState extends Equatable {
  const TouristState({
    this.status = TouristStatus.initial,
    this.tourist= const Customer(
      name: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      photo: '',
    ),
  });

  final TouristStatus status;
  final Customer tourist;

  TouristState copyWith({
    TouristStatus? status,
    Customer? tourist,
  }) {
    return TouristState(
      status: status ?? this.status,
      tourist: tourist ?? this.tourist,
    );
  }

  @override
  String toString() {
    return '''TouristState {status: $status, tourist: $tourist} ''';
  }

  @override
  List<Object?> get props => [status, tourist];
}