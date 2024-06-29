import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/cache/cache_helper.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/features/app/enum/app_language_enum.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  void changeAppLanguage(AppLanguageEnum state) {
    final getLanguage = sl<CacheHelper>().getDataString(key: "lang");
    switch (state) {
      case AppLanguageEnum.initial:
        if (getLanguage != null) {
          if (getLanguage == "ar") {
            emit(ArabicLanguage());
          } else if (getLanguage == "en") {
            emit(EnglishLanguage());
          }
        }
        break;
      case AppLanguageEnum.arabic:
        sl<CacheHelper>().put(key: "lang", value: "ar");
        emit(ArabicLanguage());
        break;
      case AppLanguageEnum.english:
        sl<CacheHelper>().put(key: "lang", value: "en");
        emit(EnglishLanguage());
        break;
      default:
    }
  }
}
