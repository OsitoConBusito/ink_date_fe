import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen/strings.g.dart';
import '../routes/app_router.dart';
import '../theme/theme.dart';

class InkDateApp extends ConsumerWidget {
  const InkDateApp({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Ink Date',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
