class ForgetPaaswordResponseModel {
  final String message;

  ForgetPaaswordResponseModel({required this.message});
  factory ForgetPaaswordResponseModel.fromJson(dynamic jsonData) {
    if (jsonData is String) {
      return ForgetPaaswordResponseModel(message: jsonData);
    }

    if (jsonData is Map<String, dynamic>) {
      return ForgetPaaswordResponseModel(message: jsonData['message'] ?? '');
    }
    throw ArgumentError(
      'Invalid jsonData for ForgetPaaswordResponseModel: $jsonData',
    );
  }
}
