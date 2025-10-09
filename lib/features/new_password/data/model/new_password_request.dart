class NewPasswordRequestModel {
  final String currentPassword;
  final String newPassword;
  final String confirmNewPassword;

  NewPasswordRequestModel({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword,
    };
  }
}
