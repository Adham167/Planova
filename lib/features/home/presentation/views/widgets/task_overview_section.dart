import 'package:flutter/material.dart';
import 'package:planova_app/features/home/models/task_card_model.dart';
import 'package:planova_app/features/home/presentation/views/widgets/header.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_card.dart';
import 'task_toggle_switch.dart';

class TaskOverviewSection extends StatefulWidget {
  const TaskOverviewSection({super.key});

  @override
  State<TaskOverviewSection> createState() => _TaskOverviewSectionState();
}

class _TaskOverviewSectionState extends State<TaskOverviewSection> {
  bool isPersonalSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: "Task Overview"),
        const SizedBox(height: 8),
        TaskToggleSwitch(
          isPersonalSelected: isPersonalSelected,
          onChanged: (val) => setState(() => isPersonalSelected = val),
        ),
        const SizedBox(height: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isPersonalSelected ? _personal() : _team(),
        ),
      ],
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
        TaskCard(
          taskCardModel: TaskCardModel(
            title: "Chemistry",
            sub: "2 of 10 completed",
            color: Colors.green.shade100,
            iconText: "C",
            progress: 0.2,
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
