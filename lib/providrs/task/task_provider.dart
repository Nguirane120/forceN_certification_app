import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/repositories/repositories.dart';
import 'package:todoapp/providrs/task/task_notifier.dart';
import 'package:todoapp/providrs/task/task_state.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskrepositoryProvider);
 
  return TaskNotifier(repository);
});
