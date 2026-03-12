import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:planova_app/features/group/presentation/views/create_group_screen.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const CreateGroupView(),
    );
  }
}
