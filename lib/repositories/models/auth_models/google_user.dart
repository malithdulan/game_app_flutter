import 'package:google_sign_in/google_sign_in.dart';

class GoogleUser {
  final GoogleSignInAccount? googleSignInAccount;
  final GoogleSignInAuthentication? googleSignInAuthentication;

  GoogleUser(
      {required this.googleSignInAccount,
      required this.googleSignInAuthentication});
}
