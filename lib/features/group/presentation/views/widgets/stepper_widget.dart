import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/assets.dart';
import 'package:planova_app/features/group/presentation/views/widgets/circle_stepper.dart';
import 'package:planova_app/features/group/presentation/views/widgets/step_label.dart';
import 'package:planova_app/features/group/presentation/views/widgets/step_line.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              CircleStepper(
                icon: Assets.imagesDetailsIconsStep,
                isActive: currentStep >= 0,
              ),

              StepLine(isActive: currentStep >= 1),

              CircleStepper(
                icon: Assets.imagesAppearenceIconsStep,
                isActive: currentStep >= 1,
              ),

              StepLine(isActive: currentStep >= 2),

              CircleStepper(
                icon: Assets.imagesMembersIconsStep,
                isActive: currentStep >= 2,
              ),
            ],
          ),

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepLabel(
                text: "Details",
                currentStep: currentStep,
                stepIndex: 0,
              ),
              StepLabel(
                text: "Appearance",
                currentStep: currentStep,
                stepIndex: 1,
              ),
              StepLabel(
                text: "Members",
                currentStep: currentStep,
                stepIndex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
