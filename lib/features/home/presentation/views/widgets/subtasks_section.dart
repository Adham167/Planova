import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/home/presentation/views/widgets/subtask_card.dart';
import 'subtasks_header.dart';

class SubtasksSection extends StatelessWidget {
  const SubtasksSection({
    super.key,
    required this.onChanged,
  });

  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubtasksHeader(),
        const SizedBox(height: 8),

        SubtaskCard(
          title: "Morning meditation",
          date: "Feb 26",
          initialIsCompleted: true,
          flagColor: AppColors.red,
          onChanged: onChanged,
        ),
        SubtaskCard(
          title: "Grocery shopping",
          date: "Feb 26",
          initialIsCompleted: true,
          flagColor: AppColors.orange,
          onChanged: onChanged,
        ),
        SubtaskCard(
          title: "Read 30 pages",
          date: "Feb 26",
          initialIsCompleted: false,
          flagColor: AppColors.green,
          onChanged: onChanged,
        ),
      ],
    );
  }
}