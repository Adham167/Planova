
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class OverallProgressCard extends StatelessWidget {
  const OverallProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kStroke),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                'Overall Progress',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kDarkBlue,
                ),
              ),
              Spacer(),
              Text(
                '50%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kColdGrey,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 6,
              backgroundColor: Color(0xFFEDF0F7),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.kLightBlue),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                '1 of 3 tasks completed',
                style: TextStyle(fontSize: 11, color: AppColors.kColdGrey),
              ),
              Spacer(),
              Text(
                '1 in progress',
                style: TextStyle(fontSize: 11, color: AppColors.kColdGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
