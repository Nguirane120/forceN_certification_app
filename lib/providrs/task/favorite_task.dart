import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/data/repositories/favorite_task.dart';

final favoriteTaskProvider =
    StateNotifierProvider<FavoriteTaskNotifier, List<Task>>((ref) {
  return FavoriteTaskNotifier();
});

class FavoriteTaskNotifier extends StateNotifier<List<Task>> {
  FavoriteTaskNotifier() : super([]) {
    _loadFavorites();
  }

  final _favoriteManager = FavoriteTaskManager();

  Future<void> _loadFavorites() async {
    final favorites = await _favoriteManager.getFavorites();
    state = favorites;
  }

  Future<void> addFavorite(Task task) async {
    await _favoriteManager.addFavorite(task);
    state = [...state, task];

    print(state);
  }

  Future<void> removeFavorite(int taskId) async {
    await _favoriteManager.removeFavorite(taskId);
    state = state.where((task) => task.id != taskId).toList();
  }

  Future<bool> isFavorite(int taskId) async {
    return _favoriteManager.isFavorite(taskId);
  }

  Future<void> getFavoriteTask() async {
    final favorites = await _favoriteManager.getFavorites();
    state = favorites;
  }
}
