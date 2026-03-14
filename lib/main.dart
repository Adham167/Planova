import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/settings/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planova Settings',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5C6BC0)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const SettingsScreen(),
    );
  }
}

