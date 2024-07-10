import 'package:flutter/material.dart';
import 'package:todoapp/utils/utils.dart';

class AppAlerts {
  static displayMessaet(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: context.textTheme.bodyMedium),
      backgroundColor: context.colorScheme.onSecondary,
    ));
  }
}
