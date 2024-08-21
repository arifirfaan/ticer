import 'dart:convert';

import 'model_project.dart';

void updateProjectById(
  List<Project> projects,
  String projectId, {
  String? projectName,
  String? status,
  String? assignee,
  String? date,
}) {
  for (var project in projects) {
    if (project.projectId == projectId) {
      project.updateProject(
        projectName: projectName,
        status: status,
        assignee: assignee,
        date: date,
      );
      break;
    }
  }
}

String convertProjectsToJson(List<Project> projects) {
  List<Map<String, dynamic>> jsonList =
      projects.map((project) => project.toJson()).toList();
  return json.encode(jsonList);
}
