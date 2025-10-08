class VerifyResponseModel {
  final String message;

  VerifyResponseModel({required this.message});
  factory VerifyResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return VerifyResponseModel(message: jsonData['message'] ?? '');
  }
}
