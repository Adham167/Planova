import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class SubtasksHeader extends StatelessWidget {
  const SubtasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subtasks",
          style: AppStyles.medium16(context).copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primaryLightPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ],
    );
  }
}