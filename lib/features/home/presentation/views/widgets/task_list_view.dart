import 'package:flutter/material.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_item.dart';
import 'package:planova_app/features/tasks/models/TaskModel.dart';

class TaskListView extends StatelessWidget {
  final List<TaskModel> tasks;

  const TaskListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tasks.length, (index) {
        final task = tasks[index];
        return Column(
          children: [
            TaskItem(taskModel: task),
            if (index != tasks.length - 1) const SizedBox(height: 8),
          ],
        );
      }),
    );
  }
}
