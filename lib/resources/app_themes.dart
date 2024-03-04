import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._();

  AppTheme._();

  factory AppTheme() => _instance;

  get baseTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            error: AppColors.error,
            outline: AppColors.primary,
            background: AppColors.white),
        useMaterial3: true,
      );
}
