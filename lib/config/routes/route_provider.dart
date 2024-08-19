import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providrs/auth/firebase_auth.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/screens.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>(
  (ref) {
    final asyncAuthState = ref.watch(authStateProvider);
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
      ],
      redirect: (context, state) {
        final isLoggedIn = asyncAuthState.asData?.value != null;
        if (!isLoggedIn && state.namedLocation('/') != RouteLocation.home) {
          return '/login';
        }
        if (isLoggedIn && state.namedLocation('/login') == '/login') {
          return '/';
        }
        return null;
      },
    );
  },
);
