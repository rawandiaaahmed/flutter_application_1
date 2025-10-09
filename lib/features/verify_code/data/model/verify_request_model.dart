class VerifyRequestModel {
  final String email;
  final String code;

  VerifyRequestModel({required this.email, required this.code});

  Map<String, dynamic> toJson() {
    return {"email": email, "code": code};
  }
}
