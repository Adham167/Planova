import 'package:flutter/material.dart';
import 'package:planova_app/features/home/models/task_card_model.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_card.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_toggle_switch.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class TaskOverviewView extends StatefulWidget {
  const TaskOverviewView({super.key});

  @override
  State<TaskOverviewView> createState() => _TaskOverviewViewState();
}

class _TaskOverviewViewState extends State<TaskOverviewView> {
  bool isPersonalSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.mediumGrey),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title:  Text("Task Overview", style: AppStyles.semiBold18(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            // Toggle Switch
            TaskToggleSwitch(
              isPersonalSelected: isPersonalSelected,
              onChanged: (val) => setState(() => isPersonalSelected = val),
            ),
            const SizedBox(height: 8),

            // Animated Task List
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isPersonalSelected ? _personal() : _team(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _personal() {
    return Column(
      key: const ValueKey('p'),
      children: [
        TaskCard(
          taskCardModel: TaskCardModel(
            title: "Mathematics",
            sub: "5 of 10 completed",
            color: Colors.blue.shade100,
            iconText: "M",
            progress: 0.6,
          ),
        ),

        TaskCard(
          taskCardModel: TaskCardModel(
            title: "Chemistry",
            sub: "2 of 10 completed",
            color: Colors.green.shade100,
            iconText: "C",
            progress: 0.2,
          ),
        ),
      ],
    );
  }

  Widget _team() {
    return Column(
      key: const ValueKey('t'),
      children: [
        TaskCard(
          taskCardModel: TaskCardModel(
            title: "Climate Research",
            isTeam: true,
            color: Colors.green.shade100,
            iconText: "C",
            sub: "5 of 10 completed",
          ),
        ),
      ],
    );
  }
}
