import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_styles.dart';
import 'package:planova_app/core/di/service_locator.dart';
import 'package:planova_app/features/group/data/models/group_item.dart';
import 'package:planova_app/features/group/data/models/group_model.dart';
import 'package:planova_app/features/group/domain/entities/group_entity.dart';
import 'package:planova_app/features/group/domain/repos/groups_repo.dart';
import 'package:planova_app/features/group/presentation/views/group_details/groups_details_view.dart';

class TaskCard extends StatelessWidget {
  final GroupEntity groupEntity;

  const TaskCard({super.key, required this.groupEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GroupsDetailsView(groupEntity: groupEntity),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.grey300),
        ),
        child: Row(
          children: [
            _buildIconBox(context),
            const SizedBox(width: 16),
            Expanded(child: _buildTaskDetails(context)),
            _buildTrailingAction(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTrailingAction(BuildContext context) {
    if (groupEntity.type == ScopeTab.team) {
      return const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.grey700,
      );
    }

    return StreamBuilder(
      stream: getIt<GroupsRepo>().streamGroupTasks(groupEntity.groupId),
      builder: (context, snapshot) {
        double currentProgress = 0.0;

        if (snapshot.hasData) {
       
          snapshot.data!.fold(
            (failure) => currentProgress = 0.0, 
            (tasks) {
              if (tasks.isNotEmpty) {
         
                int completedTasks = tasks.where((t) => t.isCompleted).length;
             
                currentProgress = completedTasks / tasks.length;
              }
            },
          );
        }

        return CircularPercentIndicator(
          radius: 24.0,
          lineWidth: 4.0,
          percent: currentProgress.clamp(0.0, 1.0),
          animation: true,
          // إيقاف الأنيميشن عند التحديث اللحظي يجعله يبدو أسرع وأكثر استجابة،
          // لكن يمكنك تركها true إذا فضلت ذلك
          animateFromLastPercent: true,
          center: Text(
            "${(currentProgress * 100).toInt()}%",
            style: AppStyles.medium12(
              context,
            ).copyWith(color: AppColors.primaryBlue),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: AppColors.grey100,
          progressColor: groupEntity.accentColor,
        );
      },
    );
  }

  Widget _buildIconBox(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: groupEntity.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          groupEntity.name[0],
          style: AppStyles.semiBold20(context).copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildTaskDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          groupEntity.name,
          style: AppStyles.medium14(
            context,
          ).copyWith(color: AppColors.primaryBlue),
        ),
        Text(
          groupEntity.description,
          style: AppStyles.regular10(
            context,
          ).copyWith(color: const Color(0xff848A94).withOpacity(0.89)),
        ),
        if (groupEntity.type == ScopeTab.team) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.people,
                size: 16,
                color: AppColors.primaryBlue.withOpacity(0.37),
              ),
              const SizedBox(width: 4),
              Text(
                "${groupEntity.memberUids.length} members",
                style: AppStyles.medium10(context),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
