import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/sign.dart';
import 'package:todoapp/providrs/auth/firebase_auth.dart';

final authProvider = ChangeNotifierProvider<Auth>((ref) {
  final auth = Auth();
  auth.init();
  return auth;
});

class Auth extends ChangeNotifier {
  late FirebaseAuth _firebaseAuth;
  late User _user;
  bool get isAuthenticated => _user != null;
  Future<void> init() async {
    _firebaseAuth = FirebaseAuth.instance;
    _firebaseAuth.authStateChanges().listen((User user) {
          _user = user;
          notifyListeners();
        } as void Function(User? event)?);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
