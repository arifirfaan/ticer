import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:ticer/training/model_project.dart';

class ProjectListPage extends StatefulWidget {
  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  late Future<List<Project>> _projectsFuture;
  bool isDelete = false;

  @override
  void initState() {
    super.initState();
    _projectsFuture = _loadProjects();
  }

  Future<List<Project>> _loadProjects() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/project_dummy.json');

    if (!(await file.exists())) {
      // File does not exist, create it and copy from assets
      await _createDefaultProjectFile(file);
    }

    String jsonString = await file.readAsString();
    List<dynamic> jsonResponse = json.decode(jsonString);

    return jsonResponse.map((project) => Project.fromJson(project)).toList();
  }

  Future<void> _createDefaultProjectFile(File file) async {
    // Load JSON from assets
    final jsonString =
        await rootBundle.loadString('assets/training/project_dummy.json');

    // Write to the file
    await file.writeAsString(jsonString);
  }

  Future<void> _deleteProject(String projectId) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/project_dummy.json');

    String jsonString = await file.readAsString();
    List<dynamic> jsonResponse = json.decode(jsonString);

    List<Project> projects =
        jsonResponse.map((project) => Project.fromJson(project)).toList();
    projects.removeWhere((project) => project.projectId == projectId);

    String updatedJsonString =
        json.encode(projects.map((project) => project.toJson()).toList());
    await file.writeAsString(updatedJsonString);

    // Refresh the list
    setState(() {
      _projectsFuture = _loadProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project List'),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isDelete = !isDelete;
              });
            },
            child: Text("Delete"),
          ),
        ],
      ),
      body: FutureBuilder<List<Project>>(
        future: _projectsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final project = snapshot.data![index];
                return ListTile(
                  title: Text(project.projectName),
                  subtitle: Text(project.status),
                  trailing: isDelete
                      ? IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              _showDeleteConfirmationDialog(project.projectId),
                        )
                      : SizedBox(),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return Center(child: Text('No data found'));
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(String projectId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Project'),
        content: Text('Are you sure you want to delete this project?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _deleteProject(projectId);
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
