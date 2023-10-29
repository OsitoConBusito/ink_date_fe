import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {
  @override
  void didUpdateProvider(
    final ProviderBase provider,
    final Object? previousValue,
    final Object? newValue,
    final ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didDisposeProvider(
    final ProviderBase provider,
    final ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "disposed"
}''');
    super.didDisposeProvider(provider, container);
  }
}
