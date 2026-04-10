import 'package:flutter/material.dart';
import 'package:planova_app/features/home/models/task_item_model.dart';
import 'package:planova_app/features/home/presentation/views/widgets/task_item.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key, required this.tasks});
  final List<TaskItemModel> tasks;
  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  late List<TaskItemModel> tasks;
  @override
  void initState() {
    tasks = List.from(widget.tasks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tasks.length, (index) {
        final task = tasks[index];
        return Column(
          children: [
            TaskItem(
              taskItemModel: task.copyWith(
                onTap: () {
                  setState(() {
                    tasks[index] = task.copyWith(isDone: !task.isDone);
                  });
                },
              ),
            ),
            if (index != tasks.length - 1) const SizedBox(height: 8),
          ],
        );
      }),
    );
  }
}
