class SignUpUser {
  final String? name;
  final String? email;
  final String? password;
  final String? accountType;
  final String? deviceType;
  final String? phoneNumber;

  SignUpUser({
    required this.name,
    required this.email,
    required this.password,
    required this.accountType,
    required this.deviceType,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name ?? "",
      'email': email ?? "",
      'password': password ?? "",
      'accountType': accountType ?? "",
      'deviceType': deviceType ?? "",
      'phoneNumber': phoneNumber ?? "",
    };
  }
}
