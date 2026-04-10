import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planova_app/core/constants/app_colors.dart';
import 'package:planova_app/core/constants/app_router.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // Device Preview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      // Routing
      routerConfig: AppRouter.router,

      // Theme
      theme: ThemeData(
        useMaterial3: true,

        // Colors
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.kPrimary,
          primary: AppColors.kPrimary,
        ),
        scaffoldBackgroundColor: AppColors.kBackGround,

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kBackGround,
          elevation: 0,
        ),

        // Fonts (أفضل من fontFamily العادي)
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}