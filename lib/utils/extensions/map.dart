import 'string.dart';

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> get filterNulls {
    final Map<String, dynamic> filtered = <String, dynamic>{};
    forEach((String key, value) {
      if (value != null) {
        filtered[key] = value;
      }
    });
    return filtered;
  }

  String? getString(String key) => this[key]?.toString();

  DateTime? getDateTime(String key) => getString(key).toDateTime;

  num? getNum(String key) => getString(key).toNum;

  double? getDouble(String key) => getString(key).toDouble;

  int? getInt(String key) => getString(key).toInt;

  bool? getBool(String key) => getString(key).toBool;

  List<T>? getList<T>(String key) => (this[key]) as List<T>?;

  Map<String, dynamic>? getMap(String key) =>
      this[key] as Map<String, dynamic>?;
}
