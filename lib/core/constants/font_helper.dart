import 'package:flutter/material.dart';

class FontHelper {
  static double scale(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;

    const baseWidth = 375;

    return size * (width / baseWidth);
  }
}