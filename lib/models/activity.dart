// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:go2climb/models/service.dart';

class Activity {
  final int id;
  final String name;
  final String description;
  Activity({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source) as Map<String, dynamic>);
}
