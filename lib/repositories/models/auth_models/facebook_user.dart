import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookUser {
  final LoginResult? loginResult;
  final String? email;
  final String? id;

  FacebookUser({required this.loginResult, required this.email, required this.id});
}