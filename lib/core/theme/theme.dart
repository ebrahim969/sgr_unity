import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData(
    fontFamily: 'Oswald',
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppPallete.backgroundColor, elevation: 0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppPallete.gradient1),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppPallete.backgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
  );
}
