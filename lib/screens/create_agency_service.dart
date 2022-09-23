import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAgencyService extends StatelessWidget {
  static const String routeName = '/create-agency-service';

  const CreateAgencyService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("Create service"),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel))
      ])),
    );
  }
}
