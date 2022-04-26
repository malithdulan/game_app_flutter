import 'package:game_app/helper/managers/secure_storage_manager.dart';
import 'package:game_app/helper/managers/shared_preference_manager.dart';
import 'package:game_app/helper/network/network.dart';
import 'package:game_app/helper/network/network_post_methods.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/repositories/models/auth_models/google_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_in_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_up_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../helper/managers/authentication_manager.dart';
import '../helper/constants.dart';

class AuthRepository {
  int? _getStatusCode(Map<String, dynamic> data) {
    return data["statusCode"] as int?;
  }

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

  Future<int> signInAccount(SignInUser? user) async {
    Map<String, dynamic> data = await Net.shared.signIn(user);
    int? code = _getStatusCode(data);
    if (code == StatusCodes.statusCodeRequestSuccess) {
      Map<String, dynamic>? resData =
          Utils.shared.getJsonBody(data)?["data"] as Map<String, dynamic>?;
      String? token = resData?["token"] as String?;
      if (token != null) {
        //save jwt token to key_store, key_chain
        SecureStorage.shared.writeSecureData(Constants.token, token);
      }
    }
    return Future.value(code);
  }

  Future<int> signUpAccount(SignUpUser? user) async {
    Map<String, dynamic> data = await Net.shared.signUp(user);
    int? code = _getStatusCode(data);
    if (code == StatusCodes.statusCodeCreated) {
      //save user data to shared_preferences, user_defaults
      SharedPreference.shared.setValue(key: Constants.name, value: user?.name);
      SharedPreference.shared
          .setValue(key: Constants.email, value: user?.email);
      SharedPreference.shared
          .setValue(key: Constants.phone, value: user?.phoneNumber);
    }
    return Future.value(code);
  }
}
