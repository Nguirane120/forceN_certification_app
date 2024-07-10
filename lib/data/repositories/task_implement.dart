import 'package:todoapp/data/datasource/task_datasource.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/data/repositories/repositories.dart';

class TaskImplement implements TaskRepository {
  final TaskDatasource _datasource;

  TaskImplement(this._datasource);
  @override
  Future<void> addTask(Task task) async {
    try {
      await _datasource.addTask(task);
    } catch (e) {
      throw "$e";
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    // TODO: implement deleteTask
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      throw "$e";
    }
  }

  @override
  Future<List<Task>> getAllTask() async {
    try {
      return await _datasource.getAllTasks();
    } catch (e) {
      throw "$e";
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      throw "$e";
    }
  }
}
