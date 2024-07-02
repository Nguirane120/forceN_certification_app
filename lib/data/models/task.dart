// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:todoapp/utils/task_categories.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String time;
  final bool? isCompleted;
  final TaskCategory category;
  const Task(
   {
     required this.category,
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.time,
    this.isCompleted
  });

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      date,
      time,
    ];
  }
}
