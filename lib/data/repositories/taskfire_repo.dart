import 'package:todoapp/data/models/firestore_models.dart';

abstract class TaskRepositoryFire {
  Future<void> addTask(FirestoreTask task);
  Future<void> updateTask(FirestoreTask task);
  Future<void> deleteTask(FirestoreTask task);
  Stream<List<FirestoreTask>> getTasks();
}
