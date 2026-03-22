import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/group/presentation/views/groups_view/widgets/groups_screen_body.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kBackGround,
      body: SafeArea(
        child: GroupsScreenBody(),
      ),
    );
  }
}