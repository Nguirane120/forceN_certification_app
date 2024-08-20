import 'package:equatable/equatable.dart';
import 'package:todoapp/utils/task_categories.dart';

class FirestoreTask extends Equatable {
  final String? id; // Utilisez String pour Firestore et int pour SQLite
  final String title;
  final String note;
  final TaskCategory category;
  final String time;
  final String date;
  final bool isCompleted;
  final String userId; // Ajouté pour Firebase

  const FirestoreTask({
    this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.date,
    required this.note,
    required this.isCompleted,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'category': category.name,
      'time': time,
      'date': date,
      'isCompleted': isCompleted ? 1 : 0,
      'userId': userId,
    };
  }

  factory FirestoreTask.fromJson(Map<String, dynamic> map) {
    return FirestoreTask(
      id: map['id'],
      title: map['title'],
      note: map['note'],
      category: TaskCategory.stringToTaskCategory(map['category']),
      time: map['time'],
      date: map['date'],
      isCompleted: map['isCompleted'] == 1,
      userId: map['userId'],
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      note,
      category,
      time,
      date,
      isCompleted,
      userId,
    ];
  }

  FirestoreTask copyWith({
    String? id,
    String? title,
    String? note,
    TaskCategory? category,
    String? time,
    String? date,
    bool? isCompleted,
    String? userId,
  }) {
    return FirestoreTask(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
      userId: userId ?? this.userId,
    );
  }
}
