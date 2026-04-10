
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class ChatMessageCard extends StatelessWidget {
  final String sender;
  final String message;
  final String time;

  const ChatMessageCard({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 22,
          height: 22,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFEFF4FF),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 13, color: Color(0xFF6E8FD8)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.kStroke),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kDarkBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.kDarkBlue,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.kColdGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
