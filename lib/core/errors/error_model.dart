class ErrorModel {
  final int statusCode;
  final String message;
  final Map<String, List<String>> errors;

  ErrorModel({
    required this.statusCode,
    required this.message,
    required this.errors,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData['statusCode'] ?? 0,
      message: jsonData['message'] ?? '',
      errors: (jsonData['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
    );
  }
}
