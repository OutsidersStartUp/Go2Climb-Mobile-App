part of 'agency_bloc.dart';

enum AgencyStatus { initial, success, failure }

class AgencyState extends Equatable {
  const AgencyState({
    this.status = AgencyStatus.initial,
    this.agency = const Agency(
        name: "",
        email: "",
        phoneNumber: "",
        description: "",
        location: "",
        ruc: "",
        photo: "",
        score: 0),
  });

  final AgencyStatus status;
  final Agency agency;

  AgencyState copyWith({
    AgencyStatus? status,
    Agency? agency,
  }) {
    return AgencyState(
      status: status ?? this.status,
      agency: agency ?? this.agency,
    );
  }

  @override
  String toString() {
    return '''AgencyState {status: $status, agency: $agency} ''';
  }

  @override
  List<Object?> get props => [status, agency];
}
