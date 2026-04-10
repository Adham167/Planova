import 'package:flutter/material.dart';

class StatisticCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color iconCircleColor;
  final Color iconColor;

  const StatisticCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconCircleColor,
    required this.iconColor,
  });
}
