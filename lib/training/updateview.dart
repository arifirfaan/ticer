import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ticer/training/model_project.dart';

class ViewPage extends StatefulWidget {
  final String projectId;

  ViewPage({required this.projectId});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Project? _project;
  final _formKey = GlobalKey<FormState>();
  late String _status;
  late List<Project> _projects; // List to hold all projects

  @override
  void initState() {
    super.initState();
    _loadProject();
  }

  Future<void> _loadProject() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/project_dummy.json');

      String jsonString;
      if (await file.exists()) {
        jsonString = await file.readAsString();
      } else {
        jsonString =
            await rootBundle.loadString('assets/training/project_dummy.json');
        await file.writeAsString(jsonString);
      }

      List<dynamic> jsonResponse = json.decode(jsonString);
      _projects =
          jsonResponse.map((project) => Project.fromJson(project)).toList();

      setState(() {
        _project = _projects
            .firstWhere((project) => project.projectId == widget.projectId);
        _status = _project!.status;
      });
    } catch (e) {
      print('Error loading project: $e');
    }
  }

  Future<void> _updateProject() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_project != null) {
        _project!.updateProject(status: _status);

        int index = _projects
            .indexWhere((project) => project.projectId == widget.projectId);
        if (index != -1) {
          _projects[index] = _project!;
        }

        // Convert updated projects back to JSON and write to the file
        String updatedJsonString =
            jsonEncode(_projects.map((project) => project.toJson()).toList());

        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/project_dummy.json');

        await file.writeAsString(updatedJsonString);

        // Show the updated project list
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Project updated successfully!')));

        _showUpdatedProjects(context);
      }
    }
  }

  void _showUpdatedProjects(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Updated Projects'),
          content: SingleChildScrollView(
            child: ListBody(
              children: _projects.map((project) {
                return Text(
                    'Project Name: ${project.projectName}, Status: ${project.status}');
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Project Status')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _project == null
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Project Name: ${_project!.projectName}'),
                    TextFormField(
                      initialValue: _status,
                      decoration: InputDecoration(labelText: 'Status'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a status';
                        }
                        return null;
                      },
                      onSaved: (value) => _status = value!,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _updateProject,
                      child: Text('Update Status'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
