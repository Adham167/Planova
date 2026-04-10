
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/group/presentation/views/group_details/groups_details_view.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/member_card.dart';

class MembersTab extends StatelessWidget {
  const MembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                'Members',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kDarkBlue,
                ),
              ),
              Spacer(),
              Icon(Icons.link, size: 14, color: AppColors.kColdGrey),
              SizedBox(width: 4),
              Text(
                'Re-invite',
                style: TextStyle(fontSize: 12, color: AppColors.kColdGrey),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              MemberCard(
                initial: 'F',
                name: 'Frank',
                role: 'Admin',
                trailing: MemberTrailing.admin,
              ),
              SizedBox(height: 10),
              MemberCard(
                initial: 'G',
                name: 'Grace',
                role: 'member',
                trailing: MemberTrailing.delete,
              ),
              SizedBox(height: 10),
              MemberCard(
                initial: 'H',
                name: 'Hank',
                role: 'member',
                trailing: MemberTrailing.delete,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
