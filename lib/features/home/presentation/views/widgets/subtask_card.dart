import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';

class SubtaskCard extends StatefulWidget {
  final String title;
  final String date;
  final bool initialIsCompleted;
  final Color flagColor;
  final ValueChanged<bool>? onChanged;
  const SubtaskCard({
    super.key,
    required this.title,
    required this.date,
    this.initialIsCompleted = false,
    required this.flagColor,
    this.onChanged,
  });

  @override
  State<SubtaskCard> createState() => _SubtaskCardState();
}

class _SubtaskCardState extends State<SubtaskCard> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.initialIsCompleted;
  }

  void _toggleCheckbox() {
    setState(() {
      isCompleted = !isCompleted;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(isCompleted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCompleted
                ? AppColors.primaryLightPurple.withOpacity(0.2)
                : AppColors.grey300,
          ),
          boxShadow: isCompleted
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.primaryLightPurple
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted
                      ? AppColors.primaryLightPurple
                      : AppColors.grey300,
                  width: 1.5,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: AppColors.white)
                  : null,
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: AppStyles.medium14.copyWith(
                      color: isCompleted
                          ? AppColors.mediumGrey
                          : AppColors.primaryBlue,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    child: Text(widget.title),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.mediumGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.date,
                        style: AppStyles.regular10.copyWith(
                          color: AppColors.mediumGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Priority Flag
            Icon(Icons.outlined_flag, color: widget.flagColor, size: 20),
          ],
        ),
      ),
    );
  }
}
