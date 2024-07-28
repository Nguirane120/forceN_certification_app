import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/data/models/task.dart';

class FavoriteTaskManager {
  static const String _favoritesKey = 'favoriteTasks';

  Future<void> addFavorite(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favorites = prefs.getStringList(_favoritesKey) ?? [];
    final taskJson = json.encode(task.toJson());
    favorites?.add(taskJson);
    await prefs.setStringList(_favoritesKey, favorites!);
  }

  Future<void> removeFavorite(int taskId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favorites = prefs.getStringList(_favoritesKey) ?? [];
    favorites!
        .removeWhere((task) => Task.fromJson(json.decode(task)).id == taskId);
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<List<Task>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites!.map((task) => Task.fromJson(json.decode(task))).toList();
  }

  Future<bool> isFavorite(int taskId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites!
        .any((task) => Task.fromJson(json.decode(task)).id == taskId);
  }
}
