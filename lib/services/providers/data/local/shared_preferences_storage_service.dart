import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

class SharedPrefsService implements StorageService {
  SharedPreferences? sharedPreferences;

  final Completer<SharedPreferences> initCompleter =
      Completer<SharedPreferences>();

  @override
  Future<void> init() async {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(final String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.get(key);
  }

  @override
  Future<void> clear() async {
    sharedPreferences = await initCompleter.future;
    await sharedPreferences!.clear();
  }

  @override
  Future<bool> has(final String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(final String key) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(final String key, final String data) async {
    sharedPreferences = await initCompleter.future;
    return sharedPreferences!.setString(key, data);
  }
}
