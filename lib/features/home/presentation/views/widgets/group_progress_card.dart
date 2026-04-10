import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class GroupProgressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;

  const GroupProgressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryLightPurple,
            AppColors.primaryPurple,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text("M")),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.semiBold16(context).copyWith(color: Colors.white)),
                  Text(subtitle, style: AppStyles.regular12(context).copyWith(color: Colors.white70)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Text("Progress", style: AppStyles.regular12(context).copyWith(color: Colors.white)),
          const SizedBox(height: 6),
          Slider(
            value: progress,
            onChanged: (_) {},
            activeColor: Colors.white,
            inactiveColor: Colors.white30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text("${(progress * 100).toInt()}%", style: AppStyles.regular12(context).copyWith(color: Colors.white)),
          )
        ],
      ),
    );
  }
}