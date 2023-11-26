import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'gen/strings.g.dart';
import 'main/app.dart';
import 'main/app_env.dart';
import 'main/observers.dart';

void main() async => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(final AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  EnvInfo.initialize(environment);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
