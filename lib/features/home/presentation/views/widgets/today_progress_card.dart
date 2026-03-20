import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class TodayProgressCard extends StatelessWidget {
  const TodayProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryLightPurple,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today's Progress", style: AppStyles.medium16),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text("1 ", style: AppStyles.bold32),
                  Text(
                    "/ 3",
                    style: AppStyles.bold24.copyWith(
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "tasks Completed",
                style: AppStyles.medium14.copyWith(
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),

          CircularPercentIndicator(
            radius: 55.0,
            lineWidth: 12.0,
            animation: true,
            percent: 0.85,
            center: const Text(
              "85%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: AppColors.white,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.white,
            backgroundColor: AppColors.white.withOpacity(0.3),
            animationDuration: 1200,
            curve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}
