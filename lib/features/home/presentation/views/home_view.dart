import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // 1. Import Provider

import 'package:planova_app/core/di/service_locator.dart';
import 'package:planova_app/features/group/domain/repos/groups_repo.dart';
import 'package:planova_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:planova_app/features/tasks/repositories/task_repository.dart';

import 'package:planova_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_overview_section.dart';
import 'package:planova_app/features/home/presentation/views/widgets/today_progress_card.dart';
import 'package:planova_app/features/home/presentation/views/widgets/todays_tasks_section.dart';

import 'package:planova_app/features/auth/providers/auth_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.onNavigateToGroups,
    required this.onNavigateToTasks,
  });
  final VoidCallback onNavigateToGroups;
  final VoidCallback onNavigateToTasks;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = context.read<AuthProvider>();

      if (authProvider.userData == null) {
        authProvider.fetchUserData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt<TaskRepository>(), getIt<GroupsRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      final String displayName =
                          authProvider.userName ?? "User";

                      return CustomAppBar(userName: displayName);
                    },
                  ),
                  const SizedBox(height: 24),
                  const TodayProgressCard(),
                  const SizedBox(height: 24),
                  TodaysTasksSection(onSeeAllTapped: widget.onNavigateToTasks),
                  const SizedBox(height: 24),
                  TaskOverviewSection(
                    onSeeAllTapped: widget.onNavigateToGroups,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
