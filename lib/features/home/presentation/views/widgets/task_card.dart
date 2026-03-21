import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Add this import
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/home/models/task_card_model.dart';
import 'package:planova_app/features/home/presentation/views/group_details_view.dart';

class TaskCard extends StatelessWidget {
  final TaskCardModel taskCardModel;

  const TaskCard({super.key, required this.taskCardModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => GroupDetailsView()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.grey300),
        ),
        child: Row(
          children: [
            _buildIconBox(),
            const SizedBox(width: 16),
            Expanded(child: _buildTaskDetails()),
            _buildTrailingAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildTrailingAction() {
    if (taskCardModel.isTeam) {
      return const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.grey700,
      );
    }

    return CircularPercentIndicator(
      radius: 24.0,
      lineWidth: 4.0,
      percent: taskCardModel.progress,
      animation: true,
      animationDuration: 1000,
      center: Text(
        "${(taskCardModel.progress * 100).toInt()}%",
        style: AppStyles.medium12.copyWith(color: AppColors.primaryBlue),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: AppColors.grey100,
      progressColor: taskCardModel.color,
    );
  }

  Widget _buildIconBox() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: taskCardModel.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          taskCardModel.iconText,
          style: AppStyles.semiBold20.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildTaskDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          taskCardModel.title,
          style: AppStyles.medium14.copyWith(color: AppColors.primaryBlue),
        ),
        Text(
          taskCardModel.sub,
          style: AppStyles.regular10.copyWith(
            color: const Color(0xff848A94).withOpacity(0.89),
          ),
        ),
        if (taskCardModel.isTeam) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.people,
                size: 16,
                color: AppColors.primaryBlue.withOpacity(0.37),
              ),
              const SizedBox(width: 4),
              const Text("3 Members", style: AppStyles.medium10),
            ],
          ),
        ],
      ],
    );
  }
}
