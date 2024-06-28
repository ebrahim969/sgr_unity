part of 'app_theme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}
final class AppThemeLightMode extends AppThemeState {}
final class AppThemeDarkMode extends AppThemeState {}

