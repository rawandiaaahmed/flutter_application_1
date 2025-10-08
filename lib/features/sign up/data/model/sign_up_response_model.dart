class SignUpResponsModel {
  final String message;

  SignUpResponsModel({required this.message});
  factory SignUpResponsModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpResponsModel(message: jsonData['message'] ?? '');
  }
}
