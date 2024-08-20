import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/data/repositories/firestore/firestore_task.dart';
import 'package:todoapp/data/repositories/taskfire_repo.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final firebaseTaskRepositoryProvider = Provider<TaskRepositoryFire>((ref) {
  final firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  return FirebaseTaskRepository(firestore: firestore, userId: userId);
});

final connectivityProvider = FutureProvider<bool>((ref) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi;
});
