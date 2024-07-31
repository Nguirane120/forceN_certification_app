import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
        navigatorKey: _rootNavigatorKey,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            // name: RouteLocation.home,
            path: RouteLocation.home,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const MaterialPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: RouteLocation.createTask,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final task = state.extra as Task?;

              return MaterialPage(
                child: CreateTask(task: task),
              );
            },
          ),
          GoRoute(
            // name: RouteLocation.createTask,
            path: RouteLocation.profile,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const MaterialPage(
              child: ProfileWidget(),
            ),
          ),
          GoRoute(
            // name: RouteLocation.createTask,
            path: RouteLocation.login,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const MaterialPage(
              child: LoginScreen(),
            ),
          ),
        ]);
  },
);
