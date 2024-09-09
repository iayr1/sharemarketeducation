import 'package:edtech_app/config/color/app_color.dart';
import 'package:flutter/material.dart';

class AppGradients {
  // Login and SignUp Gradient
  static const LinearGradient loginSignUpGradient = LinearGradient(
    colors: [
      AppColors.backgroundColorOverlay,
      AppColors.backgroundColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text Field Gradient
  static const LinearGradient textFieldGradient = LinearGradient(
    colors: [
      AppColors.backgroundColorOverlay,
      AppColors.backgroundColor,
    ],
  );
}
