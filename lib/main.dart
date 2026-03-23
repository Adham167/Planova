import 'package:flutter/material.dart';
import 'package:planova_app/screens/tasks/view/tasks_list_screen.dart';

void main() {
  runApp(const PlanovaApp());
}

class PlanovaApp extends StatelessWidget {
  const PlanovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planova Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF9BA3EB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9BA3EB),
          primary: const Color(0xFF9BA3EB),
        ),
        useMaterial3: true,
        fontFamily: 'Inter', 
      ),
      home: const TasksScreen(),
    );
  }
}
