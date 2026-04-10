
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String date;
  final bool checked;
  final String trailingLetter;
  final Color trailingColor;

  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.checked,
    required this.trailingLetter,
    required this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kStroke),
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: checked ? const Color(0xFFECEBFF) : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: checked ? AppColors.kPrimary : const Color(0xFFD7DBE8),
              ),
            ),
            child: checked
                ? const Icon(Icons.check, size: 12, color: AppColors.kPrimary)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kDarkBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 11,
                      color: AppColors.kColdGrey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.kColdGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: trailingColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              trailingLetter,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.kColdGrey,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
