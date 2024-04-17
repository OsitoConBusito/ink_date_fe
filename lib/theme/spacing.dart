part of com.ink_date.theme;

class Sizes {
  /// large = 24
  static const double large = 24;

  /// medium = 16
  static const double medium = 16;

  /// small = 8
  static const double small = 8;

  /// xLarge = 32
  static const double xLarge = 32;

  /// xxLarge = 64
  static const double xxLarge = 64;

  /// xSmall = 4
  static const double xSmall = 4;
}

class Spacing {
  static const Widget verticalLarge = SizedBox(height: Sizes.large);
  static const Widget verticalMedium = SizedBox(height: Sizes.medium);
  static const Widget verticalSmall = SizedBox(height: Sizes.small);
  static const Widget verticalXLarge = SizedBox(height: Sizes.xLarge);
  static const Widget verticalXSmall = SizedBox(height: Sizes.xSmall);
  static const Widget horizontalLarge = SizedBox(width: Sizes.large);
  static const Widget horizontalMedium = SizedBox(width: Sizes.medium);
  static const Widget horizontalSmall = SizedBox(width: Sizes.small);
  static const Widget horizontalXLarge = SizedBox(width: Sizes.xLarge);
  static const Widget horizontalXSmall = SizedBox(width: Sizes.xSmall);
}
