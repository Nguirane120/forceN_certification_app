import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/utils.dart';

class AppAlerts {
  static displayMessaet(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: context.textTheme.bodyMedium),
      backgroundColor: context.colorScheme.onSecondary,
    ));
  }

  static Future<void> showDeleteAlerDialog(
      BuildContext context, Task task, WidgetRef ref) async {
    Widget continueButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then(
          (value) {
            displayMessaet(
              context,
              'Task deleted successfully',
            );
            context.pop();
          },
        );
      },
      child: const Text('YES'),
    );

    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: Text("YES"),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Etes vous sur de voiloir supprimer cet element ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
