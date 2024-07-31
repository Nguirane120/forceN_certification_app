import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/app/todo_app.dart';
import 'package:todoapp/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'certification',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: TodoApp()));
}

