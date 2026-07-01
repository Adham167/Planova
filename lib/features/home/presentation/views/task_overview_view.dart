import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_card.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_toggle_switch.dart';

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
        title: Text("Task Overview", style: AppStyles.semiBold18(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
        
            TaskToggleSwitch(
              isPersonalSelected: isPersonalSelected,
              onChanged: (val) => setState(() => isPersonalSelected = val),
            ),
            const SizedBox(height: 24),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

      
                final filteredGroups = state.groups.where((group) {
                  final isPersonal =
                      group.type.name.toLowerCase() == 'personal';
                  return isPersonalSelected ? isPersonal : !isPersonal;
                }).toList();

                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: filteredGroups.isEmpty
                      ? Padding(
                          key: const ValueKey('empty'),
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            "No ${isPersonalSelected ? 'Personal' : 'Team'} groups found.",
                            style: AppStyles.regular12(
                              context,
                            ).copyWith(color: AppColors.mediumGrey),
                          ),
                        )
                      : Column(
                          key: ValueKey(isPersonalSelected ? 'p' : 't'),
                          children: filteredGroups.map((group) {
                            return TaskCard(
                              groupEntity: group,
                         
                            );
                          }).toList(),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
