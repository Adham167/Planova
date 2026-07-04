import 'dart:async';
import 'package:flutter/material.dart';
import '../models/settings_user.dart';
import '../repository/settings_repository.dart';
import 'package:planova_app/features/tasks/repositories/task_repository.dart';
import 'package:planova_app/features/tasks/models/TaskModel.dart';

class SettingsProvider extends ChangeNotifier {
  final SettingsRepository repository;
  final TaskRepository taskRepository;

  StreamSubscription<SettingsUser>? _subscription;
  StreamSubscription<List<TaskModel>>?
  _tasksSubscription;

  SettingsUser? _user;
  SettingsUser? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSaving = false;
  bool get isSaving => _isSaving;


  int _completedTasks = 0;
  int get completedTasks => _completedTasks;

  int _activeTasks = 0;
  int get activeTasks => _activeTasks;

  int _currentStreak = 0;
  int get currentStreak => _currentStreak;

  int _longestStreak = 0;
  int get longestStreak => _longestStreak;

  SettingsProvider({required this.repository, required this.taskRepository});

  void loadUser() {
    _subscription?.cancel();
    _subscription = repository.watchUser().listen((user) {
      _user = user;
      notifyListeners();
    }, onError: (_) {});

  
    _tasksSubscription?.cancel();
    _tasksSubscription = taskRepository.watchUserTasks().listen((tasks) {
      _calculateStats(tasks);
    }, onError: (_) {});
  }

  void _calculateStats(List<TaskModel> tasks) {
    int active = 0;
    int completed = 0;
    Set<DateTime> completedDates = {};

    for (var task in tasks) {
      if (task.status == 'done') {
        completed++;
      
        DateTime date = DateTime(
          task.dueDate.year,
          task.dueDate.month,
          task.dueDate.day,
        );
        completedDates.add(date);
      } else {
        active++;
      }
    }

    _activeTasks = active;
    _completedTasks = completed;

   
    List<DateTime> sortedDates = completedDates.toList()
      ..sort((a, b) => b.compareTo(a)); 

    int currentStreakCalc = 0;
    int longestStreakCalc = 0;
    int tempStreak = 0;
    DateTime? previousDate;

    for (int i = sortedDates.length - 1; i >= 0; i--) {
      DateTime date = sortedDates[i];
      if (previousDate == null) {
        tempStreak = 1;
      } else {
        if (date.difference(previousDate).inDays == 1) {
          tempStreak++;
        } else {
          tempStreak = 1;
        }
      }
      if (tempStreak > longestStreakCalc) {
        longestStreakCalc = tempStreak;
      }
      previousDate = date;
    }

  
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    if (sortedDates.contains(today) || sortedDates.contains(yesterday)) {
      currentStreakCalc = 1;
      DateTime checkDate = sortedDates.contains(today) ? today : yesterday;

      while (sortedDates.contains(
        checkDate.subtract(const Duration(days: 1)),
      )) {
        currentStreakCalc++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      }
    }

    _currentStreak = currentStreakCalc;
    _longestStreak = longestStreakCalc;

    notifyListeners();
  }

  Future<void> refreshUser() async {
    try {
      _setLoading(true);
      _user = await repository.getUser();
    } catch (_) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    _setSaving(true);
    try {
      await repository.updateNotifications(enabled);
      _user = _user?.copyWith(notificationsEnabled: enabled);
    } catch (_) {
      rethrow;
    } finally {
      _setSaving(false);
    }
  }

  Future<void> updateUsername(String username) async {
    _setSaving(true);
    try {
      await repository.updateUsername(username);
      _user = _user?.copyWith(fullName: username);
    } catch (_) {
      rethrow;
    } finally {
      _setSaving(false);
    }
  }

  Future<void> updateEmail(String newEmail, String currentPassword) async {
    _setSaving(true);
    try {
      await repository.updateEmail(
        newEmail: newEmail,
        currentPassword: currentPassword,
      );
      _user = _user?.copyWith(email: newEmail);
    } catch (_) {
      rethrow;
    } finally {
      _setSaving(false);
    }
  }

  Future<void> updateProfileImageUrl(String imageUrl) async {
    _setSaving(true);
    try {
      await repository.updateProfileImageUrl(imageUrl);
      _user = _user?.copyWith(profilePicUrl: imageUrl);
    } catch (_) {
      rethrow;
    } finally {
      _setSaving(false);
    }
  }

  Future<void> updatePassword(
    String currentPassword,
    String newPassword,
  ) async {
    _setSaving(true);
    try {
      await repository.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } catch (_) {
      rethrow;
    } finally {
      _setSaving(false);
    }
  }

  Future<void> deleteAccount() async {
    _setSaving(true);
    try {
      await repository.deleteAccount();
      _user = null;
    } catch (_) {
      rethrow;
    } finally {
      _setSaving(false);
    }
  }

  void clear() {
    _subscription?.cancel();
    _tasksSubscription?.cancel();
    _user = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setSaving(bool value) {
    _isSaving = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _tasksSubscription?.cancel();
    super.dispose();
  }
}
