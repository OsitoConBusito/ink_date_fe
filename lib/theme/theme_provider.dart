part of com.ink_date.theme;

final StateNotifierProvider<AppThemeModeNotifier, ThemeMode> appThemeProvider =
    StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (final StateNotifierProviderRef<AppThemeModeNotifier, ThemeMode> ref) {
    final SharedPrefsService storage = ref.watch(storageServiceProvider);
    return AppThemeModeNotifier(storage);
  },
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  Future<void> toggleTheme() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await storageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  Future<void> getCurrentTheme() async {
    final Object? theme = await storageService.get(APP_THEME_STORAGE_KEY);
    final ThemeMode value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }
}
