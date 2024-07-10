import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/datasource/datasource.dart';
import 'package:todoapp/data/repositories/repositories.dart';

final taskrepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDataProvider);
  return TaskImplement(datasource);
});
