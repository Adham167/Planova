import 'package:flutter/material.dart';

class TaskItemModel {
  final String title;
  final String priority;
  final bool isDone;
  final VoidCallback? onTap;
  final DateTime? dueDate;
  final String? description;

  const TaskItemModel({
    this.title = "",
    this.priority = "low",
    this.isDone = false,
    this.onTap,
    this.dueDate,
    this.description,
  });


  TaskItemModel copyWith({
    String? title,
    String? priority,
    bool? isDone,
    VoidCallback? onTap,
    DateTime? dueDate,
    String? description,
  }) {
    return TaskItemModel(
      title: title ?? this.title,
      priority: priority ?? this.priority,
      isDone: isDone ?? this.isDone,
      onTap: onTap ?? this.onTap,
      dueDate: dueDate ?? this.dueDate,
      description: description ?? this.description,
    );
  }
}