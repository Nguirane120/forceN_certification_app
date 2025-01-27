import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/config/routes/location_route.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/task_categories.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/DisplayListOfTask.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static HomeScreen builder(BuildContext ctx, GoRouterState state) =>
      const HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    print(taskState.tasks.length);
    final inCompletedTasks = _incompltedTask(taskState.tasks, ref);
    final completedTasks = _compltedTask(taskState.tasks, ref);

    final date = ref.watch(dateProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonCaontainer(
                width: double.infinity,
                height: 200,
                color: context.colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(30),
                    InkWell(
                      onTap: () {
                        Helpers.selecDate(context, ref);
                      },
                      child: DisplayWhiteText(
                          text: DateFormat.yMMMd().format(date),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Gap(30),
                    const DisplayWhiteText(
                        text: "TODO LIST APP",
                        fontSize: 40,
                        fontWeight: FontWeight.normal)
                  ],
                ),
              ),
              Positioned(
                  child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonCaontainer(
                      width: deviceSize.width,
                      child: Displaylistoftask(tasks: taskState.tasks),
                    ),
                    const Gap(20),
                    const Text("completed"),
                    const Gap(20),
                    Container(
                      width: deviceSize.width,
                      decoration: BoxDecoration(
                        color: colors.primaryContainer,
                      ),
                      // child: Displaylistoftask(
                      //   tasks: completedTasks,
                      // ),
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {
                          context.push(RouteLocation.createTask);
                        },
                        child: const DisplayWhiteText(
                            text: "ADD NEW TASK",
                            fontSize: 10,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ))
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            context.push(RouteLocation.profile);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_sharp), label: "Profile"),
          ]),
    );
  }

  List<Task> _incompltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }

  List<Task> _completeTask(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTask.add(task);
      }
    }

    return filteredTask;
  }

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
