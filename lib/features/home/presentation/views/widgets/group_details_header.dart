import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class GroupDetailsHeader extends StatelessWidget {
  final String title;
  final String completionText;
  final String iconText;
  final double progress;

  const GroupDetailsHeader({
    super.key,
    required this.title,
    required this.completionText,
    required this.iconText,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryLightPurple,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryLightPurple.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    iconText,
                    style: AppStyles.bold20.copyWith(color: AppColors.white),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.bold18),
                  Text(
                    completionText,
                    style: AppStyles.regular10.copyWith(
                      color: AppColors.white.withOpacity(0.87),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Progress",
                style: AppStyles.regular12.copyWith(color: AppColors.white),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progress),
                duration: const Duration(milliseconds: 1200),
                builder: (context, value, child) {
                  return Text(
                    "${(value * 100).toInt()}%",
                    style: AppStyles.bold12,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: AppColors.white,
              inactiveTrackColor: AppColors.white.withOpacity(0.3),
              thumbColor: AppColors.white,
              disabledActiveTrackColor: AppColors.white,
              disabledInactiveTrackColor: AppColors.white.withOpacity(0.3),
              disabledThumbColor: AppColors.white,
            ),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Slider(value: value, onChanged: null);
              },
            ),
          ),
        ],
      ),
    );
  }
}
