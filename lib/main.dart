import 'package:flutter/material.dart';
import 'package:planova_app/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
