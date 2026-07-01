import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planova_app/features/group/domain/entities/group_entity.dart';
import 'package:planova_app/features/group/domain/repos/groups_repo.dart';
import 'package:planova_app/features/tasks/models/TaskModel.dart';
import 'package:planova_app/features/tasks/repositories/task_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TaskRepository _repository;
  final GroupsRepo _groupsRepo;

  StreamSubscription<List<TaskModel>>? _tasksSubscription;
  StreamSubscription? _groupsSubscription;

  HomeCubit(this._repository, this._groupsRepo) : super(const HomeState()) {
    _loadTodayProgress();
    _startListeningToGroups();
  }

  void _loadTodayProgress() {
    emit(state.copyWith(isLoading: true, error: null));

    final today = DateTime.now();
    final startOfToday = DateTime(today.year, today.month, today.day);

    _tasksSubscription = _repository.watchUserTasks().listen(
      (tasks) {
        final todayTasks = tasks.where((t) {
          final taskDay = DateTime(
            t.dueDate.year,
            t.dueDate.month,
            t.dueDate.day,
          );
          return taskDay.isAtSameMomentAs(startOfToday);
        }).toList();

        final totalTasks = todayTasks.length;
        final completedTasks = todayTasks
            .where((t) => t.status == 'done')
            .length;

        emit(
          state.copyWith(
            isLoading: false,
            totalTasksToday: totalTasks,
            completedTasksToday: completedTasks,
            todaysTasks: todayTasks,
          ),
        );
      },
      onError: (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      },
    );
  }

  void _startListeningToGroups() {
    _groupsSubscription?.cancel();

    _groupsSubscription = _groupsRepo.streamGroups().listen((result) {
      result.fold(
        (failure) {
          emit(state.copyWith(error: failure.message));
        },
        (groupsList) {
          emit(state.copyWith(groups: groupsList));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    _groupsSubscription?.cancel();
    return super.close();
  }
}
