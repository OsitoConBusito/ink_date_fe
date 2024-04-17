import 'package:flutter/services.dart';

extension StringExtension on String {
  // String inkDateHour(CustomInkDate detailInkDate) {
  //   final String startDate = detailInkDate.startDate.hour > 12
  //       ? '${detailInkDate.startDate.hour} P.M'
  //       : '${detailInkDate.startDate.hour} A.M';
  //   final String endDate = detailInkDate.endDate.hour > 12
  //       ? '${detailInkDate.endDate.hour} P.M'
  //       : '${detailInkDate.endDate.hour} A.M';
  //   return '$startDate - $endDate';
  // }

  String? get userNameFromEmail => RegExp('([^@]+)').firstMatch(this)?[0];

  bool get isValidEmail => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(this);

  bool get isValidPassword =>
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*\W).{8,}$').hasMatch(this);

  Future<String> getAsset() => rootBundle.loadString(this);

  String get hideEmail {
    final String firstPart = substring(0, 1);
    final String lastPart = substring(indexOf('@'), length);
    return '$firstPart*****$lastPart';
  }

  String get initials =>
      '''${split(' ').first.substring(0, 1).toUpperCase()}${split(' ')[1].substring(0, 1).toUpperCase()}''';
}

extension StringListExtension on List<String> {
  String get joinBreadcrumbs => join(' › ');
}

extension NullableStringExtension on String? {
  DateTime? get toDateTime {
    if (this == null) {
      return null;
    }
    return DateTime.tryParse(this!);
  }

  num? get toNum => num.tryParse(this!);

  double? get toDouble => double.tryParse(this!);

  int? get toInt => int.tryParse(this ?? '');

  bool get toBool => this == 'true';
}
