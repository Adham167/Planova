import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class ProgressCircleIndicator extends StatelessWidget {
  final double progress;
  final String percentageText;

  const ProgressCircleIndicator({
    super.key,
    required this.progress,
    required this.percentageText,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 55.0,
      lineWidth: 12.0,
      animation: true,
      // 1. Pass the dynamic progress fraction (e.g., 0.5 for 50%)
      percent: progress,
      center: Text(
        // 2. Pass the dynamic percentage string (e.g., "50%")
        percentageText,
        style: AppStyles.bold18(context).copyWith(
          color: AppColors.white, // Keeping it white to contrast the background
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.white,
      backgroundColor: AppColors.white.withOpacity(0.3),
      animationDuration: 1200,
      curve: Curves.easeInOut,
    );
  }
}
