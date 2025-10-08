class ForgetPaaswordResponseModel {
  final String message;

  ForgetPaaswordResponseModel({required this.message});
  factory ForgetPaaswordResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return ForgetPaaswordResponseModel(message: jsonData['message'] ?? '');
  }
}
