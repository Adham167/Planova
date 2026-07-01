import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:planova_app/features/home/presentation/views/widgets/progress_circle_indicator.dart';

class TodayProgressCard extends StatelessWidget {
  const TodayProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.primaryLightPurple,
            borderRadius: BorderRadius.circular(24),
          ),
          child: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.kPrimary),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Progress",
                          style: AppStyles.bold16(context),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${state.completedTasksToday} ",
                              style: AppStyles.bold32(context),
                            ),
                            Text(
                              "/ ${state.totalTasksToday}",
                              style: AppStyles.bold24(context).copyWith(
                                color: AppColors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "tasks Completed",
                          style: AppStyles.medium14(
                            context,
                          ).copyWith(color: AppColors.white.withOpacity(0.7)),
                        ),
                      ],
                    ),
                    ProgressCircleIndicator(
                      progress: state.progressFraction,
                      percentageText: state.progressPercentage,
                    ),
                  ],
                ),
        );
      },
    );
  }
}
