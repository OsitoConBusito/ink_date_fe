class ParseResponse<T> {
  ParseResponse({
    this.status,
    this.message,
    this.data,
    this.success = false,
  });

  factory ParseResponse.fromMap(final Map<String, dynamic> json) =>
      ParseResponse<T>(
        success: json['status'] == 'success',
        status: json['status'],
        message: json['message'],
        data: json['data'],
      );
  final bool success;
  final String? status;
  final String? message;
  final T? data;
}
