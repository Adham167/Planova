
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/core/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              Assets.assetsImagesProfile,
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Good Morning', style: AppStyles.medium14),
                Text('Hla!', style: AppStyles.semiBold20),
              ],
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.yellowSoft,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.assetsImagesFire),
                  const SizedBox(width: 10),
                  Text(
                    "2",
                    style: AppStyles.regular12.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                Assets.assetsImagesNotification,
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
