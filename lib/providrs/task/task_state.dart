// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todoapp/data/models/task.dart';

class TaskState {
  final List<Task> tasks;
  final bool isLoading;
  final Task?
      currentTask; // Ajoutez ce champ pour stocker la tâche en cours d'édition

  const TaskState({
    required this.tasks,
    required this.isLoading,
    this.currentTask,
  });

  const TaskState.initial()
      : tasks = const [],
        isLoading = false,
        currentTask = null;

  TaskState copyWith({
    List<Task>? tasks,
    bool? isLoading,
    Task? currentTask,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      currentTask: currentTask ?? this.currentTask,
    );
  }
}
