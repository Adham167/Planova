import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_router.dart';

class GroupsSearchRow extends StatelessWidget {
  final Function(String) onSearch;

  const GroupsSearchRow({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE7E8F1)),
            ),
            child: TextField(
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: 'Search groups...',
                hintStyle: TextStyle(color: Colors.black38),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search_rounded, color: Colors.black38),
                contentPadding: EdgeInsets.only(top: 10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 42,
          height: 42,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCreateGroupView);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimary,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Icon(Icons.add_rounded),
          ),
        ),
      ],
    );
  }
}
