class MaintenanceSchedule {
  final int id;
  final String task;
  final String dueDate;
  final String status;

  MaintenanceSchedule({required this.id, required this.task, required this.dueDate, required this.status});

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) {
    return MaintenanceSchedule(
      id: json['id'],
      task: json['task'],
      dueDate: json['due_date'],
      status: json['status'],
    );
  }
}
