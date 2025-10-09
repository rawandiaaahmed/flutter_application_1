class SignUpRequestModel {
  final String firstName;
  final String phone;
  final String email;
  final String password;
  final String lastName;

  SignUpRequestModel({
    required this.firstName,
    required this.phone,
    required this.email,
    required this.password,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "phone": phone,
      "email": email,
      "password": password,
      "lastName": lastName,
    };
  }
}
