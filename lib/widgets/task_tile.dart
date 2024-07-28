import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/location_route.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/providrs/task/favorite_task.dart';
import 'package:todoapp/utils/utils.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteTasks = ref.watch(favoriteTaskProvider);
    final isFavorite = favoriteTasks.any((favTask) => favTask.id == task.id);

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(
              5,
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
              context.go(RouteLocation.createTask, extra: task);
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () async {
                final favoriteTaskNotifier =
                    ref.read(favoriteTaskProvider.notifier);
                if (isFavorite) {
                  await favoriteTaskNotifier.removeFavorite(task.id!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Task removed from favorites')),
                  );
                } else {
                  await favoriteTaskNotifier.addFavorite(task);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Task added to favorites')),
                  );
                }
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
            ),
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
