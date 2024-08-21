import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'model_project.dart';

/// copy this and put before widget build of your code
Future<String> loadJsonData() async {
  return await rootBundle.loadString('assets/training/project_dummy.json');
}

/// copy this and put before widget build of your code
Future<List<Project>> parseJson() async {
  String jsonString = await loadJsonData();
  final List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map((data) => Project.fromJson(data)).toList();
}
