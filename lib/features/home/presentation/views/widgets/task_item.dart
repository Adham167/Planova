import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/home/models/task_item_model.dart';

class TaskItem extends StatelessWidget {
  final TaskItemModel taskItemModel;

  const TaskItem({super.key, required this.taskItemModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: taskItemModel.onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: taskItemModel.isDone
                  ? AppColors.primaryLightPurple
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: taskItemModel.isDone
                    ? AppColors.primaryLightPurple
                    : AppColors.grey300,
                width: 1.5,
              ),
            ),
            child: taskItemModel.isDone
                ? const Icon(Icons.check, size: 16, color: AppColors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              taskItemModel.title,
              style: AppStyles.medium12(context).copyWith(
                color: taskItemModel.isDone
                    ? AppColors.blueGrey
                    : AppColors.darkGrey,
                decoration: taskItemModel.isDone
                    ? TextDecoration.lineThrough
                    : null,
                decorationColor: AppColors.blueGrey,
              ),
            ),
          ),
          _buildPriorityTag(taskItemModel.priority, context),
        ],
      ),
    );
  }

  Widget _buildPriorityTag(String priority, BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (priority.toLowerCase()) {
      case 'high':
        bgColor = AppColors.redBackground;
        textColor = AppColors.red;
        break;
      case 'medium':
        bgColor = AppColors.yellowSoft;
        textColor = AppColors.orange;
        break;
      case 'low':
      default:
        bgColor = AppColors.greenBackground;
        textColor = AppColors.green;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        priority,
        style: AppStyles.regular10(context).copyWith(color: textColor),
      ),
    );
  }
}
