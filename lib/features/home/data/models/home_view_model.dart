import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:planova_app/features/tasks/models/TaskModel.dart';
import 'package:planova_app/features/tasks/repositories/task_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final TaskRepository _repository;
  StreamSubscription<List<TaskModel>>? _subscription;

  int _totalTasksToday = 0;
  int _completedTasksToday = 0;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  int get totalTasksToday => _totalTasksToday;
  int get completedTasksToday => _completedTasksToday;

  double get progressFraction =>
      _totalTasksToday == 0 ? 0.0 : _completedTasksToday / _totalTasksToday;

  String get progressPercentage => "${(progressFraction * 100).toInt()}%";

  HomeViewModel(this._repository) {
    _loadTodayProgress();
  }

  void _loadTodayProgress() {
    final today = DateTime.now();
    final startOfToday = DateTime(today.year, today.month, today.day);

    _subscription = _repository.watchUserTasks().listen(
      (tasks) {
        final todayTasks = tasks.where((t) {
          final taskDay = DateTime(
            t.dueDate.year,
            t.dueDate.month,
            t.dueDate.day,
          );
          return taskDay.isAtSameMomentAs(startOfToday);
        }).toList();

        _totalTasksToday = todayTasks.length;
        _completedTasksToday = todayTasks
            .where((t) => t.status == 'done')
            .length;
        _isLoading = false;

        notifyListeners();
      },
      onError: (e) {
        print("Home Progress Error: $e");
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
