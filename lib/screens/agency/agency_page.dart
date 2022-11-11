import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go2climb/components/AppBarGo2Climb.dart';
import 'package:go2climb/constants/global_variables.dart';
import 'package:go2climb/screens/agency/agency_profile.dart';
import 'package:go2climb/screens/agency/bloc/agency_bloc.dart';
import 'package:go2climb/screens/agency/bloc/agency_event.dart';
import 'package:http/http.dart' as http;

class AgencyPage extends StatelessWidget {
  static const String routeName = '/agency-profile';

  const AgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: const AppBarGo2Climb(),
      body: BlocProvider(
        create: (_) =>
            AgencyBloc(httpClient: http.Client())..add(AgencyFetched()),
        child: AgencyProfile(),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      );

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }
}
