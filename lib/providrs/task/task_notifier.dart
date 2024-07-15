import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/data/repositories/repositories.dart';
import 'package:todoapp/providrs/providers.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;

  TaskNotifier(this._repository) : super(const TaskState.initial());

  void setTask(Task? task) {
    state = state.copyWith(currentTask: task);
  }

  Future<void> createTask(Task task) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.addTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      state = state.copyWith(isLoading: true);
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updatedTask);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      state = state.copyWith(isLoading: true);
      await _repository.deleteTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void getTasks() async {
    try {
      state = state.copyWith(isLoading: true);
      final tasks = await _repository.getAllTask();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
