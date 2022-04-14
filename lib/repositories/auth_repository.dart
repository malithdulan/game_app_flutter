import 'package:game_app/repositories/models/auth_models/google_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../helper/managers/authentication_manager.dart';

class AuthRepository {
  Future<GoogleUser> googleAuthentication() async {
    final GoogleSignInAccount? user = await Auth.shared.signIn();
    final GoogleSignInAuthentication? userAuthentication =
        await user?.authentication;
    return Future.value(GoogleUser(
        googleSignInAccount: user,
        googleSignInAuthentication: userAuthentication));
  }

  Future<String> facebookAuthentication() async {
    return Future.value("Auth");
  }

  signAccount() {}

  signUpAccount() {}
}
