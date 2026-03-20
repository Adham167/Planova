import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/features/home/presentation/views/group_details_view.dart';
import 'package:planova_app/features/home/presentation/views/home_view.dart';
import 'package:planova_app/features/home/presentation/views/task_overview_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.grey50,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.grey50,
          elevation: 0,
        ),
      ),
      home: GroupDetailsView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
