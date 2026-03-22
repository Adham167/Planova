import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/group/presentation/data/models/group_item.dart';

class GroupsScopeTabs extends StatelessWidget {
  final ScopeTab selected;
  final Function(ScopeTab) onChange;

  const GroupsScopeTabs({
    super.key,
    required this.selected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    Widget item(String label, ScopeTab value) {
      final isSelected = selected == value;

      return Expanded(
        child: GestureDetector(
          onTap: () => onChange(value),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.kPrimary : Colors.black45,
                fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 22,
      child: Row(
        children: [
          item('All Groups', ScopeTab.all),
          item('Team', ScopeTab.team),
          item('Personal', ScopeTab.personal),
        ],
      ),
    );
  }
}