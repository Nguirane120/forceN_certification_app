import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/models/models.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2),
                          color: task.category.color,
                        ),
                        child: Icon(task.category.icon),
                      ),
                      Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.title),
                            Text(task.time),
                          ],
                        ),
                      ),
                      Checkbox(value: task.isCompleted, onChanged: (value) {})
                    ],
                  ),
                );
  }
}