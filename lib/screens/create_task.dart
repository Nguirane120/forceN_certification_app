import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/config/routes/location_route.dart';
import 'package:todoapp/data/datasource/firebase_auth.dart';
import 'package:todoapp/data/models/firestore_models.dart';
import 'package:todoapp/data/models/models.dart';
import 'package:todoapp/data/repositories/taskfire_repo.dart';
import 'package:todoapp/providrs/auth/firebase_auth.dart';
import 'package:todoapp/providrs/firestre_task/fire_store.dart';
import 'package:todoapp/providrs/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_input.dart';
import 'package:todoapp/widgets/display_white_text.dart';
import 'package:todoapp/widgets/select_categories.dart';
import 'package:todoapp/widgets/selecte_date_time.dart';

class CreateTask extends ConsumerStatefulWidget {
  final Task? task;

  const CreateTask(
      {super.key, this.task}); // Utiliser le constructeur nommé ici

  static CreateTask builder(BuildContext ctx, GoRouterState state) {
    final task = state.extra as Task?;
    return CreateTask(task: task); // Passer l'objet task ici
  }

  @override
  ConsumerState<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends ConsumerState<CreateTask> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _noteController = TextEditingController();
    final task = widget.task;
    if (task != null) {
      isEdit = true;
      _titleController.text = task.title;
      _noteController.text = task.note;
      // ref.read(taskProvider.notifier).setTask(task);
    }
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.go(RouteLocation.home);
            },
          ),
        ],
        title: Text(isEdit ? 'Edit Task' : 'Create Task'),
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
              onPressed: _create,
              child: Text(isEdit ? 'Update' : 'Create'),
            )
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
    final isConnected =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;
    final user = ref.watch(authStateProvider);


    if (title.isNotEmpty) {
      if (isEdit) {
        final updatedTask = Task(
          id: widget.task!.id,
          title: title,
          category: category,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          note: note,
          isCompleted:
              widget.task!.isCompleted, // Conservez l'état complet existant
        );

        await ref
            .read(taskProvider.notifier)
            .updateTask(updatedTask)
            .then((value) {
          AppAlerts.displayMessaet(context, "Task mis à jour avec succès");
          context.go(RouteLocation.home);
        }).catchError((error) {
          AppAlerts.displayMessaet(
              context, "Erreur lors de la mise à jour de la tâche");
        });
      } else {
        if (isConnected) {
          final firestore_task = FirestoreTask(
            title: title,
            category: category,
            time: Helpers.timeToString(time),
            date: DateFormat.yMMMd().format(date),
            note: note,
            isCompleted: false,
            userId: user.value!.uid,
          );
          final firestoreTaskRepository =
              ref.read(firebaseTaskRepositoryProvider);

          await firestoreTaskRepository.addTask(firestore_task);
        }
        // Si c'est une création
        final newTask = Task(
          title: title,
          category: category,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          note: note,
          isCompleted:
              false, // Nouvelle tâche, donc marquée comme non complétée
        );

        await ref.read(taskProvider.notifier).createTask(newTask).then((value) {
          AppAlerts.displayMessaet(context, "Task ajouté avec succès");
          context.go(RouteLocation.home);
        }).catchError((error) {
          AppAlerts.displayMessaet(
              context, "Erreur lors de l'ajout de la tâche");
        });
      }
    } else {
      AppAlerts.displayMessaet(context, "Veuillez remplir le titre");
    }
  }
}
