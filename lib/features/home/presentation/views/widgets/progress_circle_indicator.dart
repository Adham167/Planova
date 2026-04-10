import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class ProgressCircleIndicator extends StatelessWidget {
  const ProgressCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 55.0,
      lineWidth: 12.0,
      animation: true,
      percent: 0.85,
      center:  Text("85%", style: AppStyles.bold18(context)),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppColors.white,
      backgroundColor: AppColors.white.withOpacity(0.3),
      animationDuration: 1200,
      curve: Curves.easeInOut,
    );
  }
}
