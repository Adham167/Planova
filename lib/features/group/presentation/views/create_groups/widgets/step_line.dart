import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class StepLine extends StatelessWidget {
  const StepLine({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? AppColors.kPrimary : AppColors.mediumGrey,
      ),
    );
  }
}
