
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';

class GroupTabsBar extends StatelessWidget {
  const GroupTabsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.kPrimary,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.kDarkBlue,
        labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        tabs: [
          Tab(text: 'Tasks'),
          Tab(text: 'Members'),
          Tab(text: 'Chat'),
        ],
      ),
    );
  }
}
