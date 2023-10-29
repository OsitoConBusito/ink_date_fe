import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gen/strings.g.dart';
import 'main/app.dart';
import 'main/app_env.dart';
import 'main/observers.dart';

void main() async => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(final AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    TranslationProvider(
      child: ProviderScope(
        observers: <Observers>[
          Observers(),
        ],
        child: const InkDateApp(),
      ),
    ),
  );
}
