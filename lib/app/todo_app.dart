import 'package:flutter/material.dart';
import 'package:todoapp/config/theme/app_theme.dart';
import 'package:todoapp/config/theme/theme.dart';
import 'package:todoapp/screens/screens.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HomeScreen()
    );
  }
}
