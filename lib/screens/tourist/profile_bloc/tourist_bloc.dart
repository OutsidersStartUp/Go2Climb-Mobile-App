import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go2climb/screens/tourist/profile_bloc/tourist_event.dart';
import 'package:http/http.dart' as http;
import 'package:go2climb/models/customer.dart';

part 'tourist_state.dart';

int index = 1;

class TouristBloc extends Bloc<TouristEvent, TouristState> {
  TouristBloc({required this.httpClient}) : super(const TouristState()) {
    on<TouristFetched>(
      _onTouristFetched,
    );
  }
  final http.Client httpClient;

  Future<void> _onTouristFetched(
      TouristFetched event, Emitter<TouristState> emit) async {
    try {
      if (state.status == TouristStatus.initial) {
        final tourist = await _fetchTourist(index);
        return emit(
            state.copyWith(status: TouristStatus.success, tourist: tourist));
      }
    } catch (_) {
      emit(state.copyWith(status: TouristStatus.failure));
    }
  }

  Future<Customer> _fetchTourist(int id) async {
    final response = await http.get(
      Uri.https(
        'go2climb.azurewebsites.net',
        '/api/v1/customers/$id',
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final tourist = Customer.fromMap(body);

      return tourist;
    }
    throw Exception('Error fetching tourist');
  }
}