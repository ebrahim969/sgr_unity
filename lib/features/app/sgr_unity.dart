import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:sgr_unity/core/theme/theme.dart';
import 'package:sgr_unity/features/app/custom_material_app.dart';

class SGRBlogs extends StatelessWidget {
  const SGRBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, state) {
            if (state is AppThemeLightMode) {
              return CustomMaterialApp(theme: AppTheme.lightThemeMode,);
            } else if (state is AppThemeDarkMode) {
              return CustomMaterialApp(theme: AppTheme.darkThemeMode,);
            } else {
              return CustomMaterialApp(theme: AppTheme.darkThemeMode,);
            }
          },
        );
      },
    );
  }
}

