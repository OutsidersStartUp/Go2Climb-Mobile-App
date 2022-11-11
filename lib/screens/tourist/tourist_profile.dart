import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go2climb/screens/tourist/profile_bloc/tourist_bloc.dart';
import 'package:go2climb/screens/tourist/tourist_details.dart';

class TouristProfile extends StatefulWidget {
  const TouristProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<TouristProfile> createState() => _TouristProfileState();
}

class _TouristProfileState extends State<TouristProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TouristBloc, TouristState>(builder: (context, state) {
      switch (state.status) {
        case TouristStatus.failure:
          return const Center(
            child: Text('Failed to fetch Tourist'),
          );
        case TouristStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case TouristStatus.success:
          return TouristDetails(
            tourist: state.tourist,
          );
      }
    });
  }
}