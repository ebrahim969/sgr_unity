import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/cache/cache_helper.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/core/theme/enum/app_theme_enum.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  final sharedPref = sl<CacheHelper>();
  void changeAppTheme(AppThemeEnum state) {
    final getTheme = sharedPref.getDataString(key: 'theme');
    switch (state) {
      case AppThemeEnum.initial:
        if (getTheme != null) {
          if (getTheme == 'l') {
            emit(AppThemeLightMode());
          } else if(getTheme == 'd'){
            emit(AppThemeDarkMode());
          }
        }
        break;
      case AppThemeEnum.light:
        sharedPref.put(key: 'theme', value: 'l');
        emit(AppThemeLightMode());
        break;
      case AppThemeEnum.dark:
        sharedPref.put(key: 'theme', value: 'd');
        emit(AppThemeDarkMode());
        break;
      default:
    }
  }
}
