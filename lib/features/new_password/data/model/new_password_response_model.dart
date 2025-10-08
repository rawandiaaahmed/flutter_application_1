class NewPasswordResponseModel {
  final String message;

  NewPasswordResponseModel({required this.message});
  factory NewPasswordResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return NewPasswordResponseModel(message: jsonData['message'] ?? '');
  }
}
