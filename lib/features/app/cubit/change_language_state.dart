part of 'change_language_cubit.dart';

@immutable
sealed class ChangeLanguageState {}

final class ChangeLanguageInitial extends ChangeLanguageState {}
final class ArabicLanguage extends ChangeLanguageState {}
final class EnglishLanguage extends ChangeLanguageState {}
