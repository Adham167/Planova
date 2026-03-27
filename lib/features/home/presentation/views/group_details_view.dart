import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/home/presentation/views/widgets/edit_action_button.dart';
import 'package:planova_app/features/home/presentation/views/widgets/group_details_header.dart';
import 'package:planova_app/features/home/presentation/views/widgets/subtasks_section.dart';

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
    final progress = completedTasks / totalTasks;

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
        title:  Text("Group Details", style: AppStyles.semiBold18(context)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: EditActionButton(),
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
              progress: progress,
            ),
            const SizedBox(height: 16),
            SubtasksSection(onChanged: _updateProgress),
          ],
        ),
      ),
    );
  }
}
