import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/utils/task_categories.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/DisplayListOfTask.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(30),
                  DisplayWhiteText(
                      text: "JULY 02 2024",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  Gap(30),
                  DisplayWhiteText(
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
                    child: const Displaylistoftask(
                      tasks: [
                        Task(
                            id: 1,
                            title: "gym",
                            note: "10",
                            date: "July 02 204",
                            time: "20:30",
                            category: TaskCategory.education,
                            isCompleted: true),
                        Task(
                            id: 2,
                            title: "coding",
                            note: "10",
                            date: "July 02 204",
                            time: "20:30",
                            category: TaskCategory.education,
                            isCompleted: true),
                      ],
                    ),
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
                    //   tasks: [
                    //     Task(
                    //         id: 1,
                    //         title: "gym",
                    //         note: "10",
                    //         date: "July 02 204",
                    //         time: "20:30",
                    //         category: TaskCategory.education,
                    //         isCompleted: true),
                    //     Task(
                    //         id: 2,
                    //         title: "coding",
                    //         note: "10",
                    //         date: "July 02 204",
                    //         time: "20:30",
                    //         category: TaskCategory.education,
                    //         isCompleted: true),
                    //   ],
                    // ),
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () {},
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
    ));
  }
}
