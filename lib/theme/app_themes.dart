part of com.ink_date.theme;

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _themeData(_lightColorScheme);

  static ThemeData _themeData(final ColorScheme colorScheme) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          elevation: 0,
          iconTheme: IconThemeData(color: colorScheme.primary),
        ),
        canvasColor: colorScheme.surface,
        colorScheme: colorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.beige),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(
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
            side: WidgetStateProperty.all(
              const BorderSide(
                color: AppColors.darkGreen,
                width: 2,
              ),
            ),
          ),
        ),
        primaryColor: AppColors.darkGreen,
        primaryColorLight: AppColors.beige,
        scaffoldBackgroundColor: colorScheme.surface,
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
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(Size.zero),
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
    surface: AppColors.lightGrey,
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
