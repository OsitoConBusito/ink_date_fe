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
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(this);
}
