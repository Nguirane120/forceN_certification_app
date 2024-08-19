import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/config/theme/app_theme.dart';
import 'package:todoapp/config/theme/theme.dart';
import 'package:todoapp/providrs/providers.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerconfig = ref.watch(routesProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // routerConfig: routerconfig,
      routerDelegate: routerconfig.routerDelegate,
      routeInformationParser: routerconfig.routeInformationParser,
      routeInformationProvider: routerconfig.routeInformationProvider,
    );
  }
}
