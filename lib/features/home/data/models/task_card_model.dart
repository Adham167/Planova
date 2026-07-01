import 'package:flutter/material.dart';

class TaskCardModel {
  final String title;
  final String sub;
  final Color color;
  final String iconText;
  final double progress;
  final bool isTeam;


  const TaskCardModel({
    this.title = "",
    this.sub = "",
    this.color = Colors.grey,
    this.iconText = "",
    this.progress = 0.0,
    this.isTeam = false,
  });
}