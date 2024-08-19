import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/providrs/auth/firebase_auth.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/login_screen.dart';

class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Erreur : $error'),
    );
  }
}
