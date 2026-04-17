import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/group/presentation/views/create_groups/widgets/create_group_body.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGround,
      appBar: AppBar(
        backgroundColor: AppColors.kBackGround,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.mediumGrey),
        ),
        title: Text("Create Group", style: AppStyles.styleSemiBold18),
      ),
      body: SafeArea(child: CreateGroupBody()),
    );
  }
}
