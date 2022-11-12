import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go2climb/screens/agency/agency_details.dart';
import 'package:go2climb/screens/agency/bloc/agency_bloc.dart';

class AgencyProfile extends StatefulWidget {
  const AgencyProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<AgencyProfile> createState() => _AgencyProfileState();
}

class _AgencyProfileState extends State<AgencyProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgencyBloc, AgencyState>(builder: (context, state) {
      switch (state.status) {
        case AgencyStatus.failure:
          return const Center(
            child: Text('Failed to fetch Agency'),
          );
        case AgencyStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case AgencyStatus.success:
          return AgencyDetails(
            agency: state.agency,
          );
      }
    });
  }
}
