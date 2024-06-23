import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/router/app_rourer.dart';
import 'package:sgr_unity/core/theme/theme.dart';

class SGRBlogs extends StatelessWidget {
  const SGRBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkThemeMode,
          routerConfig: routes,
        );
      },
    );
  }
}
