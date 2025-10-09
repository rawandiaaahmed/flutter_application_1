class NewPasswordResponseModel {
  final String message;

  NewPasswordResponseModel({required this.message});
  factory NewPasswordResponseModel.fromJson(dynamic jsonData) {
    if (jsonData is String) {
      return NewPasswordResponseModel(message: jsonData);
    }

    if (jsonData is Map<String, dynamic>) {
      return NewPasswordResponseModel(message: jsonData['message'] ?? '');
    }
    throw ArgumentError(
      'Invalid jsonData for ForgetPaaswordResponseModel: $jsonData',
    );
  }
}
