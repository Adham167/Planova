import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/features/group/presentation/views/edit_groups/widgets/edit_group_view_body.dart';

class EditGroupView extends StatelessWidget {
  const EditGroupView({super.key});

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
          icon: Icon(Icons.arrow_back_ios, color: AppColors.kMiduemGrey),
        ),
        title: Text("Edit Group", style: AppStyles.styleSemiBold18),
      ),
      body: SafeArea(child: EditGroupViewBody()),
    );
  }
}
