import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class Displaylistoftask extends ConsumerWidget {
  const Displaylistoftask(
      {super.key, required this.tasks, this.isCompletedTak = false});
  final List<Task> tasks;
  final bool isCompletedTak;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    // final height = isCompletedTak ? deviceSize.height * 0.25 : deviceSize.height * 0.8;
    final emptyTaskMessage =
        isCompletedTak ? "there no task todo" : "there is no complete task";
    return CommonCaontainer(
      height: 200,
      child: tasks.isEmpty
          ? Center(child: Text(emptyTaskMessage))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (ctx, indx) {
                final task = tasks[indx];
                return InkWell(
                  child: TaskTile(
                    task: task,
                  ),
                  onLongPress: () async {
                    AppAlerts.showDeleteAlerDialog(context, task, ref);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetail(task: task);
                        });
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
