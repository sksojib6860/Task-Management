import 'package:intl/intl.dart';

class TaskCountModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String email;
  final String createdDate;

  TaskCountModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.email,
    required this.createdDate,
  });
  factory TaskCountModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskCountModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      description: jsonData['description'],
      status: jsonData['status'],
      email: jsonData['email'],
      createdDate: DateFormat(
        'dd-MM-yy- hh:mm a',
      ).format(DateTime.parse(jsonData['createdDate'])),
    );
  }
}
