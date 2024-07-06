import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:todoapp/screens/home_screen.dart';

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
                MaterialPage(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            // name: RouteLocation.createTask,
            path: RouteLocation.createTask,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                MaterialPage(
              child: const CreateTask(),
            ),
          ),
        ]);
  },
);
