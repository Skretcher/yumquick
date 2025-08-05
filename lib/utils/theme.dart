import 'package:flutter/material.dart';

/// 🍋 App Color Palette
class AppColors {
  static const yellow = Color(0xFFFFCB4C); // Splash background
  static const yellowDark = Color(0xFFFFD55F); // Header background
  static const lightYellow = Color(0xFFFFECB3); // Input fields
  static const orange = Color(0xFFFF6F00); // Buttons
  static const deepOrange =
      Color(0xFFFF5722); // Secondary actions (Sign Up, etc.)
  static const greyText = Colors.black54; // Subtext
  static const text = Colors.black; // Default text
  static const white = Colors.white; // Card, background
  static const success = Colors.green; // Success Snackbar
  static const error = Colors.red; // Error Snackbar
}

/// 🧑‍🎨 Text Styles (Based on Figma font sizes & weights)
class AppTextStyles {
  static const header = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const welcome = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 245, 243, 243),
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.greyText,
  );

  static const input = TextStyle(
    fontSize: 16,
    color: AppColors.text,
  );

  static const button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const link = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.deepOrange,
  );

  static const prompt = TextStyle(
    fontSize: 14,
    color: AppColors.text,
  );

  static const title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.deepOrange,
  );

  static const price = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.deepOrange,
  );
}

/// 📐 Common Sizes, Padding, Radius, Icon Sizes
class AppSizes {
  static const double inputRadius = 14;
  static const double cardRadius = 30;
  static const double buttonRadius = 30;
  static const double headerHeight = 150;
  static const double iconSize = 36;
}
