import 'package:flutter/material.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/chat_tab.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/group_tabs_bar.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/group_top_info.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/members_tab.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/overall_progress_card.dart';
import 'package:planova_app/features/group/presentation/views/group_details/widgets/tasks_tab.dart';

class GroupDetailsBody extends StatelessWidget {
  const GroupDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
      child: Column(
        children: const [
          GroupTopInfo(),
          SizedBox(height: 12),
          OverallProgressCard(),
          SizedBox(height: 12),
          GroupTabsBar(),
          SizedBox(height: 12),
          Expanded(
            child: TabBarView(children: [TasksTab(), MembersTab(), ChatTab()]),
          ),
        ],
      ),
    );
  }
}
