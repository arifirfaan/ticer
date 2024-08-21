import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticer/training/model_project.dart'; // Update the import path as necessary

Future<List<Project>> fetchProjects() async {
  final response =
      await http.get(Uri.parse('https://api.example.com/projects'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((project) => Project.fromJson(project)).toList();
  } else {
    throw Exception('Failed to load projects');
  }
}
