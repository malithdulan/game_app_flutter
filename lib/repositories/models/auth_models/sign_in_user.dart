class SignInUser {
  final String? email;
  final String? password;
  final String? accountType;

  SignInUser({
    required this.email,
    required this.password,
    required this.accountType,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email ?? "",
      'password': password ?? "",
      'accountType': accountType ?? "",
    };
  }
}
