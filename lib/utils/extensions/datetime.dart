extension DatetimeExtension on DateTime {
  bool isSameDate(final DateTime other) => year == other.year && month == other.month && day == other.day;
}
