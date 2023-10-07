extension IntExtension on int {
  String get dateToString => toString().length == 2
        ? toString().padRight(3, ':00')
        : toString().padLeft(2, '0').padRight(3, ':00');
}
