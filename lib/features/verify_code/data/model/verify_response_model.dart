class VerifyResponseModel {
  final String message;

  VerifyResponseModel({required this.message});
  factory VerifyResponseModel.fromJson(dynamic jsonData) {
    if (jsonData is String) {
      return VerifyResponseModel(message: jsonData);
    }

    if (jsonData is Map<String, dynamic>) {
      return VerifyResponseModel(message: jsonData['message'] ?? '');
    }
    throw ArgumentError(
      'Invalid jsonData for ForgetPaaswordResponseModel: $jsonData',
    );
  }
}
