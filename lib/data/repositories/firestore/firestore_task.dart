import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/data/models/firestore_models.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/data/repositories/task_repository.dart';
import 'package:todoapp/data/repositories/taskfire_repo.dart';

class FirebaseTaskRepository implements TaskRepositoryFire {
  final FirebaseFirestore _firestore;
  final String _userId;

  FirebaseTaskRepository({
    required FirebaseFirestore firestore,
    required String userId,
  })  : _firestore = firestore,
        _userId = userId;

  @override
  Future<void> addTask(FirestoreTask task) async {
    final taskRef = _firestore.collection('tasks').doc();
    await taskRef.set(task.copyWith(id: taskRef.id, userId: _userId).toJson());
  }

  @override
  Stream<List<FirestoreTask>> getTasks() {
    return _firestore
        .collection('tasks')
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => FirestoreTask.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<void> updateTask(FirestoreTask task) async {
    await _firestore.collection('tasks').doc(task.id).update(task.toJson());
  }

  @override
  Future<void> deleteTask(FirestoreTask task) async {
    await _firestore.collection('tasks').doc(task.id).delete();
  }
}
