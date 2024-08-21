class Project {
  String projectId;
  String projectName;
  String status;
  String assignee;
  String date;

  Project({
    required this.projectId,
    required this.projectName,
    required this.status,
    required this.assignee,
    required this.date,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['project_id'],
      projectName: json['projectname'],
      status: json['status'],
      assignee: json['assignee'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'projectname': projectName,
      'status': status,
      'assignee': assignee,
      'date': date,
    };
  }

  void updateProject({
    String? projectName,
    String? status,
    String? assignee,
    String? date,
  }) {
    if (projectName != null) this.projectName = projectName;
    if (status != null) this.status = status;
    if (assignee != null) this.assignee = assignee;
    if (date != null) this.date = date;
  }
}
