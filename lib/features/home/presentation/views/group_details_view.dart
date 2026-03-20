import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/core/constants/assets.dart';
import 'package:planova_app/features/home/presentation/views/widgets/group_details_header.dart';
import 'package:planova_app/features/home/presentation/views/widgets/subtask_card.dart';

class GroupDetailsView extends StatefulWidget {
  const GroupDetailsView({super.key});

  @override
  State<GroupDetailsView> createState() => _GroupDetailsViewState();
}

class _GroupDetailsViewState extends State<GroupDetailsView> {
  int totalTasks = 3;
  int completedTasks = 2;

  void _updateProgress(bool isNowCompleted) {
    setState(() {
      if (isNowCompleted) {
        completedTasks++;
      } else {
        completedTasks--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = completedTasks / totalTasks;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.mediumGrey,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Group Details", style: AppStyles.semiBold18),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _buildEditAction(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupDetailsHeader(
              title: "Mathematics",
              completionText: "$completedTasks of $totalTasks completed",
              iconText: "M",
              progress: progressValue,
            ),
            const SizedBox(height: 16),
            _buildSubtasksHeader(),
            const SizedBox(height: 8),
            SubtaskCard(
              title: "Morning meditation",
              date: "Feb 26",
              initialIsCompleted: true,
              flagColor: AppColors.red,
              onChanged: _updateProgress,
            ),
            SubtaskCard(
              title: "Grocery shopping",
              date: "Feb 26",
              initialIsCompleted: true,
              flagColor: AppColors.orange,
              onChanged: _updateProgress,
            ),
            SubtaskCard(
              title: "Read 30 pages",
              date: "Feb 26",
              initialIsCompleted: false,
              flagColor: AppColors.green,
              onChanged: _updateProgress,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditAction() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey350),
      ),
      child: SvgPicture.asset(Assets.assetsImagesEdit, width: 18, height: 18),
    );
  }

  Widget _buildSubtasksHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subtasks",
          style: AppStyles.medium16.copyWith(color: AppColors.primaryBlue),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primaryLightPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.add, color: AppColors.white, size: 24),
        ),
      ],
    );
  }
}
