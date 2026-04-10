
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class GroupTopInfo extends StatelessWidget {
  const GroupTopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kStroke),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.kLightBlue,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Text(
              'M',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Molecular Biology',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kDarkBlue,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.circle, size: 7, color: AppColors.kGreen),
                    SizedBox(width: 4),
                    Text(
                      'ACTIVE',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.kColdGrey,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '3 members',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.kColdGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  'Deep dive into molecular biology concepts and lab work coordination.',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.kColdGrey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
