import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/config/di/di_config/di.dart';
import 'package:trust_develpoment/app/core/router/app_router.dart';
import 'package:trust_develpoment/app/core/ui_helper/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
