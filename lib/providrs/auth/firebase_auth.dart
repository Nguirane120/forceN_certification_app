import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/sign.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final signInProvider =
    FutureProvider.autoDispose.family<User?, SignInParams>((ref, params) async {
  try {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return userCredential.user;
  } catch (e) {
    throw e; // Propager l'erreur pour la gestion dans l'UI
  }
});

final signOutProvider = FutureProvider<void>((ref) async {
  final auth = ref.read(firebaseAuthProvider);
  await auth.signOut();
});
