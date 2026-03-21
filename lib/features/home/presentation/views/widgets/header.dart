import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.semiBold16.copyWith(color: AppColors.primaryBlue),
        ),
        TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              Text(
                'View All',
                style: AppStyles.medium12.copyWith(
                  color: AppColors.primaryPurple,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryPurple,
                size: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
