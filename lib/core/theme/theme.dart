import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class AppTheme {
  static _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  // Dark theme
  static final darkThemeMode = ThemeData(
    fontFamily: 'Noto',
    scaffoldBackgroundColor: AppPallete.darkBackgroundColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppPallete.darkBackgroundColor, elevation: 0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppPallete.gradient1),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppPallete.darkBackgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(AppPallete.borderDarkColor),
      enabledBorder: _border(AppPallete.borderDarkColor),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
  );

  //Light theme

  static final lightThemeMode = ThemeData(
    fontFamily: 'Noto',
    scaffoldBackgroundColor: AppPallete.lightBackgroundColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppPallete.lightBackgroundColor, elevation: 0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppPallete.gradient3),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppPallete.lightBackgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(AppPallete.borderLightColor),
      enabledBorder: _border(AppPallete.borderLightColor),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
  );
}
