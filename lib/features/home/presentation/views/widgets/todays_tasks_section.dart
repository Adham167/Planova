import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/home/models/task_item_model.dart';
import 'package:planova_app/features/home/presentation/views/widgets/header.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_list_view.dart';

class TodaysTasksSection extends StatelessWidget {
  const TodaysTasksSection({super.key});

  final List<TaskItemModel> tasks = const [
    TaskItemModel(title: "Morning Workout", priority: "medium", isDone: true),
    TaskItemModel(title: "Grocery Shopping", priority: "high"),
    TaskItemModel(title: "Read Book", priority: "low"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(title: "Today’s Tasks"),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.grey300),
          ),
          child: TaskListView(tasks: tasks),
        ),
      ],
    );
  }
}
