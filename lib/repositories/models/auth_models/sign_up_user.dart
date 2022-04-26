class SignUpUser {
  late String? name;
  late String? email;
  late String? password;
  final String? accountType;
  final String? deviceType;
  late String? phoneNumber;

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
