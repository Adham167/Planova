import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../models/statisticCardData.dart';

Widget buildStatisticCard(StatisticCardData data) {
  return Card(
    color: AppColors.cardColor,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: data.iconCircleColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(data.icon, size: 20, color: data.iconColor),
          ),
          const SizedBox(height: 12),
          Text(
            data.title,
            style: GoogleFonts.poppins(
              color: AppColors.textGrey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.value,
            style: GoogleFonts.poppins(
              color: AppColors.textDark,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}
