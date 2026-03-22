
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class StepLabel extends StatelessWidget {
  const StepLabel({
    super.key,
    required this.text,
    required this.currentStep,
    required this.stepIndex,
  });

  final String text;
  final int currentStep;
  final int stepIndex;

  @override
  Widget build(BuildContext context) {
    final bool active = currentStep >= stepIndex;

    return Text(
      text,
      style: AppStyles.styleMedium12.copyWith(
        color: active ? AppColors.kPrimary : AppColors.kMiduemGrey,
      ),
    );
  }
}
