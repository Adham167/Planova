import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/tasks/models/TaskModel.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
final VoidCallback? onTap; 

  const TaskItem({super.key, required this.taskModel, this.onTap,});

  @override
  Widget build(BuildContext context) {
    final bool isDone = taskModel.status == 'done';
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color:isDone
                  ? AppColors.primaryLightPurple
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isDone
                    ? AppColors.primaryLightPurple
                    : AppColors.grey300,
                width: 1.5,
              ),
            ),
            child: isDone
                ? const Icon(Icons.check, size: 16, color: AppColors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              taskModel.title,
              style: AppStyles.medium12(context).copyWith(
                color: isDone
                    ? AppColors.blueGrey
                    : AppColors.darkGrey,
                decoration:isDone
                    ? TextDecoration.lineThrough
                    : null,
                decorationColor: AppColors.blueGrey,
              ),
            ),
          ),
          _buildPriorityTag(taskModel.priority, context),
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
