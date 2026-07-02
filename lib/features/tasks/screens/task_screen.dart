import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/new_task_provider.dart';
import '../widgets/task_details_widgets/task_app_bar.dart';
import '../widgets/task_details_widgets/task_date_picker.dart';
import '../widgets/task_details_widgets/task_input_fields.dart';
import '../widgets/task_details_widgets/task_options_row.dart';
import '../widgets/task_details_widgets/task_reminder.dart';
import '../widgets/task_details_widgets/primary_button.dart';
import 'package:planova_app/features/tasks/models/TaskModel.dart';

class CreateTaskScreen extends StatefulWidget {
  final bool isEdit;
  final TaskModel? task;

  const CreateTaskScreen({super.key, this.isEdit = false, this.task});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<NewTaskProvider>();

      provider.fetchGroups();

      if (widget.isEdit && widget.task != null) {
        provider.loadTask(widget.task!);
      } else {
        if (provider.groupId == null) {
          provider.clearTask();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskProvider>(
      builder: (context, provider, child) {
        List<DropdownMenuItem<String?>> dropDownItems = [
          const DropdownMenuItem(
            value: null,
            child: Text(
              'Personal Tasks',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ];

        bool isGroupInList = provider.availableGroups.any(
          (g) => g.groupId == provider.groupId,
        );

        if (provider.groupId != null && !isGroupInList) {
          dropDownItems.add(
            DropdownMenuItem(
              value: provider.groupId,
              child: Text(provider.groupName ?? 'Loading Group...'),
            ),
          );
        }

        dropDownItems.addAll(
          provider.availableGroups.map(
            (g) => DropdownMenuItem(value: g.groupId, child: Text(g.name)),
          ),
        );

        return Scaffold(
          appBar: TaskAppBar(
            title: widget.isEdit ? "Task Details" : "New Task",
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskInputFields(
                    initialTitle: provider.title,
                    initialDescription: provider.description,
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    "Group",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String?>(
                        isExpanded: true,
                        value: provider.groupId,
                        hint: const Text("Select Group"),
                        items: dropDownItems,
                        onChanged: (val) {
                          if (val == provider.groupId)
                            return; // No change needed

                          if (val == null) {
                            provider.setGroup(null, null);
                          } else {
                            final selectedGroup = provider.availableGroups
                                .firstWhere((g) => g.groupId == val);
                            provider.setGroup(
                              selectedGroup.groupId,
                              selectedGroup.name,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const TaskOptionsRow(),
                  const SizedBox(height: 16),
                  const TaskDatePicker(),
                  const SizedBox(height: 16),
                  const TaskReminder(),
                  const SizedBox(height: 30),

                  PrimaryButton(
                    text: provider.isSubmitting
                        ? (widget.isEdit ? "Saving..." : "Creating...")
                        : (widget.isEdit ? "Save Changes" : "Create Task"),
                    onPressed: () async {
                      if (widget.isEdit && widget.task != null) {
                        await provider.updateTask(widget.task!.taskId);
                      } else {
                        await provider.submitTask();
                      }

                      if (provider.status == NewTaskStatus.success) {
                        if (context.mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                widget.isEdit
                                    ? "Task Updated Successfully"
                                    : "Task Created Successfully",
                              ),
                            ),
                          );
                        }
                      }

                      if (provider.status == NewTaskStatus.error) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                provider.error ?? "Something went wrong",
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
