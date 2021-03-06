import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
  Future<GoogleSignInAccount?> googleSignIn() => _googleSingIn.signIn();
  Future<GoogleSignInAccount?> googleSignOut() => _googleSingIn.signOut();

  //facebook authentication
  Future<LoginResult> facebookSignIn() => FacebookAuth.instance.login();
  Future<Map<String, dynamic>> facebookUserData() => FacebookAuth.instance.getUserData();
  Future<void> facebookSignOut() => FacebookAuth.instance.logOut();
}
