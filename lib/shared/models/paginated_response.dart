const int perPageLimit = 20;

class PaginatedResponse<T> {
  PaginatedResponse({
    required this.total,
    required this.skip,
    required this.data,
  });

  factory PaginatedResponse.fromJson(
    final Map<String, dynamic> json,
    final List<T> data,
  ) =>
      PaginatedResponse<T>(
        total: json['total'] ?? 0,
        skip: json['skip'] ?? 0,
        data: data,
      );
  final int total;

  final int skip;

  static const int limit = perPageLimit;

  final List<T> data;
  @override
  String toString() =>
      'PaginatedResponse(total:$total, skip:$skip, data:${data.length})';
}
