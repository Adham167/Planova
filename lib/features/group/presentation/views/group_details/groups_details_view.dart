import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_router.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/group_details_body.dart';

class GroupsDetailsView extends StatelessWidget {
  const GroupsDetailsView({super.key, this.initialTab = 0});
  final int initialTab;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: initialTab,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kBackGround,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: const Icon(Icons.chevron_left, color: AppColors.kDarkBlue),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kEditGroupView);
                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: AppColors.kColdGrey,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        body: GroupDetailsBody(),
      ),
    );
  }
}

enum MemberTrailing { admin, delete }

