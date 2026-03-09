import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';

BoxDecoration shadowDecoration({
  required BuildContext context,
  required int designHeight,

  double opacity = 0.7,
  double blurRadius = 37,
  double spreadRadius = -8,
  double offsetY = 14,
}) {
  final screenHeight = MediaQuery.sizeOf(context).height;

  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: colorShadowButtonGradientStart.withValues(alpha: opacity),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: Offset(0, screenHeight * (offsetY / designHeight)),
      ),
      BoxShadow(
        color: colorShadowButtonGradientEnd.withValues(alpha: opacity),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: Offset(0, screenHeight * (offsetY / designHeight)),
      ),
    ],
  );
}
