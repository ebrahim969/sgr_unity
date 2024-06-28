import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sgr_unity/core/router/app_rourer.dart';
import 'package:sgr_unity/generated/l10n.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key, required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: routes,
    );
  }
}
