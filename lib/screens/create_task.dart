import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/config/routes/location_route.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_input.dart';
import 'package:todoapp/widgets/display_white_text.dart';
import 'package:todoapp/widgets/select_categories.dart';
import 'package:todoapp/widgets/selecte_date_time.dart';

class CreateTask extends ConsumerStatefulWidget {
  const CreateTask({super.key});
  static CreateTask builder(BuildContext ctx, GoRouterState state) =>
      const CreateTask();

  @override
  ConsumerState<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends ConsumerState<CreateTask> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: "ADD NEW TASK"),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonInput(
              title: "TITLE",
              hint: "TITLE",
              controller: _titleController,
            ),
            SelecteCategory(),
            SelecteDatetime(),
            Gap(16),
            CommonInput(
              title: "NOTE",
              hint: "10",
              controller: _noteController,
            ),
            Gap(10),
            ElevatedButton(
                onPressed: _create, child: DisplayWhiteText(text: "SAVE"))
          ],
        ),
      ),
    );
  }

  void _create() async {
    final title = _titleController.text;
    final note = _noteController.text;
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
          title: title,
          category: category,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          note: note,
          isCompleted: false);
      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displayMessaet(context, "Task ajoute avec succee");
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displayMessaet(context, "Veuillez remplir le titre");
    }
  }
}
