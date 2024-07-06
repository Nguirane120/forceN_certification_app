import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:todoapp/screens/home_screen.dart';

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
];
