class ForgetPasswordRequestModel {
  final String email;

  ForgetPasswordRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {"email": email};
  }
}
