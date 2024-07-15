import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/location_route.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/utils.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(
              8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2),
              color: task.category.color,
            ),
            child: Icon(task.category.icon),
          ),
          const Gap(10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title),
                Text(task.time),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              print(task);
              context.go(RouteLocation.createTask, extra: task);
            },
          )
          // Checkbox(
          //     value: task.isCompleted,
          //     onChanged: (value) async {
          //       await ref
          //           .read(taskProvider.notifier)
          //           .updateTask(task)
          //           .then((value) {
          //         AppAlerts.displayMessaet(context,
          //             task.isCompleted ? "Task Completed" : "Task Uncompleted");
          //       });
          //     })
        ],
      ),
    );
  }
}
