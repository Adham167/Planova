import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class TaskToggleSwitch extends StatelessWidget {
  final bool isPersonalSelected;
  final ValueChanged<bool> onChanged;

  const TaskToggleSwitch({
    super.key,
    required this.isPersonalSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.grey350),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth / 2;

          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: isPersonalSelected ? 0 : width,
                child: Container(
                  width: width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightPurple,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryLightPurple.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Row(children: [_item("Personal", true), _item("Team", false)]),
            ],
          );
        },
      ),
    );
  }

  Widget _item(String title, bool isPersonal) {
    final active = isPersonalSelected == isPersonal;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(isPersonal),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppStyles.semiBold16.copyWith(
              color: active ? AppColors.white : AppColors.primaryBlue,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
