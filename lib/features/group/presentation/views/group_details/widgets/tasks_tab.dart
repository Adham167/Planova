import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/square_plus_button.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/task_card.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kDarkBlue,
                ),
              ),
              Spacer(),
              SquarePlusButton(),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              TaskCard(
                title: 'Morning meditation',
                date: 'Feb 26',
                checked: true,
                trailingLetter: 'P',
                trailingColor: Color(0xFFF7D9D9),
              ),
              SizedBox(height: 10),
              TaskCard(
                title: 'Grocery shopping',
                date: 'Feb 26',
                checked: true,
                trailingLetter: 'P',
                trailingColor: Color(0xFFF7E8C9),
              ),
              SizedBox(height: 10),
              TaskCard(
                title: 'Read 30 pages',
                date: 'Feb 26',
                checked: false,
                trailingLetter: 'P',
                trailingColor: Color(0xFFDFF3DF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
