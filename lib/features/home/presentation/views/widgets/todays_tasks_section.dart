import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:planova_app/features/home/presentation/views/widgets/header.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_list_view.dart';

class TodaysTasksSection extends StatelessWidget {
  const TodaysTasksSection({super.key,required this.onSeeAllTapped});

  final VoidCallback onSeeAllTapped; 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final previewTasks = state.todaysTasks.take(3).toList();

        if (state.todaysTasks.isEmpty) {
          return const SizedBox.shrink();
        } else if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.kPrimary),
          );
        }

        return Column(
          children: [
            Header(
              title: "Today’s Tasks",
              onTap:onSeeAllTapped
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.grey300),
              ),
              child: TaskListView(tasks: previewTasks),
            ),
          ],
        );
      },
    );
  }
}
