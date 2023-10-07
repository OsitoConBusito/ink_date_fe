abstract class StorageService {
  void init();

  bool get hasInitialized;

  Future<bool> remove(final String key);

  Future<Object?> get(final String key);

  Future<bool> set(final String key, final String data);

  Future<void> clear();

  Future<bool> has(final String key);
}
