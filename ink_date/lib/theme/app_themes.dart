part of com.ink_date.theme;

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _themeData(_lightColorScheme);

  static ThemeData _themeData(final ColorScheme colorScheme) => ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      canvasColor: colorScheme.background,
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.beige),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
      focusColor: AppColors.darkGreen,
      fontFamily: AppFontFamily.quicksand,
      highlightColor: Colors.transparent,
      hintColor: AppColors.darkGreen,
      iconTheme: const IconThemeData(color: AppColors.darkGreen),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: AppColors.darkGreen,
              width: 2,
            ),
          ),
        ),
      ),
      primaryColor: AppColors.darkGreen,
      primaryColorLight: AppColors.beige,
      scaffoldBackgroundColor: colorScheme.background,
      shadowColor: Colors.grey.shade100,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          AppColors.beige,
          Colors.white,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      textTheme: const TextTheme(),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.backgroundGrey,
        hourMinuteColor: AppColors.darkGreen,
        dialTextColor: AppColors.darkGreen,
        dayPeriodColor: AppColors.darkGreen,
        dayPeriodTextColor: Colors.white,
        entryModeIconColor: AppColors.darkGreen,
        dialBackgroundColor: Colors.white,
        hourMinuteTextColor: Colors.white,
      ),
    );

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    background: AppColors.lightGrey,
    error: Colors.red,
    onError: Colors.black,
    onSecondary: AppColors.darkGreen,
    primary: AppColors.darkGreen,
    primaryContainer: AppColors.darkGreen,
    secondary: AppColors.beige,
    secondaryContainer: AppColors.beige,
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(),
    colorScheme: const ColorScheme.dark(),
    elevatedButtonTheme: const ElevatedButtonThemeData(),
    fontFamily: AppFontFamily.quicksand,
    iconTheme: const IconThemeData(),
    scaffoldBackgroundColor: AppColors.lightGrey,
    snackBarTheme: const SnackBarThemeData(),
    textButtonTheme: const TextButtonThemeData(),
    textTheme: const TextTheme(),
  );
}
