part of 'home_cubit.dart';

class HomeState {
  final bool isLoading;
  final int totalTasksToday;
  final int completedTasksToday;
  final List<GroupEntity> groups;
  final List<TaskModel> todaysTasks;
  final String? error;

  const HomeState({
    this.isLoading = true,
    this.totalTasksToday = 0,
    this.completedTasksToday = 0,
    this.groups = const [],
    this.todaysTasks = const [],
    this.error,
  });

  double get progressFraction =>
      totalTasksToday == 0 ? 0.0 : completedTasksToday / totalTasksToday;

  String get progressPercentage => "${(progressFraction * 100).toInt()}%";

  HomeState copyWith({
    bool? isLoading,
    int? totalTasksToday,
    int? completedTasksToday,
    List<TaskModel>? todaysTasks,
    List<GroupEntity>? groups,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      groups: groups ?? this.groups,
      totalTasksToday: totalTasksToday ?? this.totalTasksToday,
      completedTasksToday: completedTasksToday ?? this.completedTasksToday,
      todaysTasks: todaysTasks ?? this.todaysTasks,
      error: error ?? this.error,
    );
  }
}
