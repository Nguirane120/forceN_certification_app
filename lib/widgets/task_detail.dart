import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/task/task_provider.dart';
import 'package:todoapp/utils/app_alerts.dart';

class TaskDetail extends ConsumerWidget {
  const TaskDetail({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Icon(
            task.category.icon,
            color: task.category.color,
          ),
          Text(
            task.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Checkbox(
              value: task.isCompleted,
              onChanged: (value) async {
                await ref
                    .read(taskProvider.notifier)
                    .updateTask(task)
                    .then((value) {
                  Navigator.of(context).pop();
                  AppAlerts.displayMessaet(context,
                      task.isCompleted ? "Task Completed" : "Task Uncompleted");
                });
              }),
          Gap(10),
          Visibility(
            visible: task.isCompleted ?? false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Task to be complted ${task.date}"),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          Gap(16),
          Text(task.note.isEmpty ? "No note" : task.note),
        ],
      ),
    );
  }
}
