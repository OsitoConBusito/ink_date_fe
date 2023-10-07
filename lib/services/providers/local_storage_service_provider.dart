import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/local/shared_preferences_storage_service.dart';

final Provider<SharedPrefsService> storageServiceProvider =
    Provider<SharedPrefsService>((final ProviderRef<SharedPrefsService> ref) {
  final SharedPrefsService prefsService = SharedPrefsService()..init();
  return prefsService;
});
