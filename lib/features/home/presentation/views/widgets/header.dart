import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.medium16.copyWith(color: AppColors.primaryBlue),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'View All',
                style: AppStyles.regular12.copyWith(
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
