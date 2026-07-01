import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:planova_app/features/home/presentation/views/widgets/header.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_card.dart';
import 'task_toggle_switch.dart';

class TaskOverviewSection extends StatefulWidget {
  final VoidCallback onSeeAllTapped;

  const TaskOverviewSection({super.key, required this.onSeeAllTapped});

  @override
  State<TaskOverviewSection> createState() => _TaskOverviewSectionState();
}

class _TaskOverviewSectionState extends State<TaskOverviewSection> {
  bool isPersonalSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: "Task Overview", onTap: widget.onSeeAllTapped),
        const SizedBox(height: 8),
        TaskToggleSwitch(
          isPersonalSelected: isPersonalSelected,
          onChanged: (val) => setState(() => isPersonalSelected = val),
        ),
        const SizedBox(height: 8),

        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }

            final filteredGroups = state.groups.where((group) {
              final isPersonal = group.type.name.toLowerCase() == 'personal';
              return isPersonalSelected ? isPersonal : !isPersonal;
            }).toList();

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: filteredGroups.isEmpty
                  ? _buildEmptyState(context)
                  : Column(
                      key: ValueKey(isPersonalSelected ? 'p' : 't'),
                      children: filteredGroups.map((group) {
                        return TaskCard(groupEntity: group);
                      }).toList(),
                    ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      key: const ValueKey('empty'),
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isPersonalSelected
                ? Icons.person_off_outlined
                : Icons.group_off_outlined,
            size: 48,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 12),
          Text(
            "No ${isPersonalSelected ? 'Personal' : 'Team'} Groups",
            style: AppStyles.medium14(
              context,
            ).copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          Text(
            "Create a new group to see your tasks here.",
            textAlign: TextAlign.center,
            style: AppStyles.regular12(
              context,
            ).copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
