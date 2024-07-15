import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: _rootNavigatorKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: _rootNavigatorKey,
    builder: CreateTask.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (context, state) {
      final task = state.extra as Task?;
      return CreateTask(task: task);
    },
  ),
];
