import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/core/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final String firstLetter = userName.isNotEmpty
        ? userName[0].toUpperCase()
        : 'U';

    return Row(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryLightPurple,
              child: Text(
                firstLetter,
                style: AppStyles.semiBold20(
                  context,
                ).copyWith(color: AppColors.white),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning', style: AppStyles.medium14(context)),
                Text(userName, style: AppStyles.semiBold20(context)),
              ],
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //   decoration: BoxDecoration(
            //     color: AppColors.yellowSoft,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Row(
            //     children: [
            //       SvgPicture.asset(Assets.imagesFire),
            //       const SizedBox(width: 10),
            //       Text(
            //         "2",
            //         style: AppStyles.regular12(
            //           context,
            //         ).copyWith(color: AppColors.orange),
            //       ),
            //     ],
            //   ),
            // ),
            IconButton(
              icon: SvgPicture.asset(
                Assets.imagesNotification,
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
