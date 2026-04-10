import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_router.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        primaryColor: const Color(0xFF9BA3EB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9BA3EB),
          primary: const Color(0xFF9BA3EB),
        ),
        scaffoldBackgroundColor: AppColors.grey50,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.grey50,
          elevation: 0,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
    );
  }
}