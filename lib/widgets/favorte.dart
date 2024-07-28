import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providrs/task/favorite_task.dart';

class Favorte extends ConsumerWidget {
  const Favorte({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteTasks = ref.watch(favoriteTaskProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteTasks.length,
        itemBuilder: (context, index) {
          final task = favoriteTasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.note),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await ref
                    .read(favoriteTaskProvider.notifier)
                    .removeFavorite(task.id!);
              },
            ),
          );
        },
      ),
    );
  }
}
