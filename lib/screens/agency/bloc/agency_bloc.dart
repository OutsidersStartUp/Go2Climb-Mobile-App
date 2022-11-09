import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go2climb/models/agency.dart';
import 'package:http/http.dart' as http;

import 'package:go2climb/screens/agency/bloc/agency_event.dart';

part 'agency_state.dart';

int index = 1;

class AgencyBloc extends Bloc<AgencyEvent, AgencyState> {
  AgencyBloc({required this.httpClient}) : super(const AgencyState()) {
    on<AgencyFetched>(
      _onAgencyFetched,
    );
  }
  final http.Client httpClient;

  Future<void> _onAgencyFetched(
      AgencyFetched event, Emitter<AgencyState> emit) async {
    try {
      if (state.status == AgencyStatus.initial) {
        final agency = await _fetchAgency(index);
        return emit(
            state.copyWith(status: AgencyStatus.success, agency: agency));
      }
    } catch (_) {
      emit(state.copyWith(status: AgencyStatus.failure));
    }
  }

  //https://go2climb.azurewebsites.net/api/v1/agencies/1
  Future<Agency> _fetchAgency(int id) async {
    final response = await http.get(
      Uri.https(
        'go2climb.azurewebsites.net',
        '/api/v1/agencies/$id',
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final agency = Agency.fromMap(body);

      return agency;
    }
    throw Exception('error fetching agency');
  }
}
