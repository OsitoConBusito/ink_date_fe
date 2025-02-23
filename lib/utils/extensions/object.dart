typedef ConvertFunction<T> = dynamic Function(Map<String, dynamic> json);

extension ObjectExtension on Object {
  T withConverter<T>({required ConvertFunction<T> fromJson}) =>
      fromJson(this as Map<String, dynamic>) as T;

  List<T> withConverterList<T>({required ConvertFunction<T> fromJson}) =>
      (this as List<dynamic>)
          .map((e) => fromJson(e as Map<String, dynamic>) as T)
          .toList();
}
