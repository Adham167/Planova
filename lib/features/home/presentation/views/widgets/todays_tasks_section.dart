import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/home/models/task_item_model.dart';
import 'package:planova_app/features/home/presentation/views/widgets/header.dart';
import 'task_item.dart';

class TodaysTasksSection extends StatefulWidget {
  const TodaysTasksSection({super.key});

  @override
  State<TodaysTasksSection> createState() => _TodaysTasksSectionState();
}

class _TodaysTasksSectionState extends State<TodaysTasksSection> {
  final List<TaskItemModel> tasks = [
    const TaskItemModel(
      title: "Morning Workout",
      priority: "medium",
      isDone: true,
    ),
    const TaskItemModel(title: "Grocery Shopping", priority: "high"),
    const TaskItemModel(title: "Read Book", priority: "low"),
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
          child: Column(
            children: List.generate(tasks.length, (index) {
              final task = tasks[index];
              return Column(
                children: [
                  TaskItem(
                    taskItemModel: task.copyWith(
                      onTap: () {
                        setState(() {
                          tasks[index] = task.copyWith(isDone: !task.isDone);
                        });
                      },
                    ),
                  ),
                  if (index != tasks.length - 1) const SizedBox(height: 8),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
