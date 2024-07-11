import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/date_provider.dart';

class Helpers {
  Helpers._();

  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final DateTime date =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);

      return DateFormat.jm().format(date);
    } catch (e) {
      return "13:35";
    }
  }


  static void selecDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.watch(dateProvider);
    DateTime? pickedDate = await showDatePicker(
        initialDate: initialDate,
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    final DateTime taskDate = _stringToDateTime(task.date);
    if (taskDate.month == selectedDate.month &&
        taskDate.year == selectedDate.year &&
        taskDate.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  static DateTime _stringToDateTime(String dateString) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static String dateFormatter(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      return DateFormat.yMMMd().format(
        DateTime.now(),
      );
    }
  }
}
