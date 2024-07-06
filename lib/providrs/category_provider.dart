import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/utils/task_categories.dart';

final categoryProvider = StateProvider<TaskCategory>((ref) {
  return TaskCategory.others;
});
