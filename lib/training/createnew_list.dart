import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ticer/training/model_project.dart';

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final _formKey = GlobalKey<FormState>();
  late String _projectId, _projectName, _status, _assignee, _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Project ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a project ID';
                  }
                  return null;
                },
                onSaved: (value) => _projectId = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Project Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a project name';
                  }
                  return null;
                },
                onSaved: (value) => _projectName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a status';
                  }
                  return null;
                },
                onSaved: (value) => _status = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Assignee'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an assignee';
                  }
                  return null;
                },
                onSaved: (value) => _assignee = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
                onSaved: (value) => _date = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProject,
                child: Text('Save Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveProject() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Project newProject = Project(
        projectId: _projectId,
        projectName: _projectName,
        status: _status,
        assignee: _assignee,
        date: _date,
      );

      await _addProjectToFile(newProject);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Project added successfully!')),
      );
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  Future<void> _addProjectToFile(Project newProject) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/project_dummy.json');

    String jsonString = await file.readAsString();
    List<dynamic> jsonResponse = json.decode(jsonString);

    List<Project> projects =
        jsonResponse.map((project) => Project.fromJson(project)).toList();
    projects.add(newProject);

    String updatedJsonString =
        json.encode(projects.map((project) => project.toJson()).toList());
    await file.writeAsString(updatedJsonString);
  }
}
