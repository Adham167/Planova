import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/core/constants/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: Image.asset(
            Assets.assetsImagesProfile,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: const Text('Good Morning', style: AppStyles.medium14),
          subtitle: const Text('Hla!', style: AppStyles.semiBold20),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.yellowSoft,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesFire),
                const SizedBox(width: 10),
                Text("2", style: AppStyles.regular12),
              ],
            ),
          ),

          IconButton(
            icon: SvgPicture.asset(
              Assets.assetsImagesNotification,
              width: 24,
              height: 24,
            ),
            color: AppColors.blueGrey,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
