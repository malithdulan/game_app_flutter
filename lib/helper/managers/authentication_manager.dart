import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  //singleton implementation
  Auth._privateConstructor(); //private constructor
  static Auth? _shared; //shared instance
  static Auth get shared {
    _shared ??= Auth._privateConstructor();
    return _shared!;
  }

  //google authentication
  final _googleSingIn = GoogleSignIn();
  Future<GoogleSignInAccount?> signIn() => _googleSingIn.signIn();

  //facebook authentication
}
