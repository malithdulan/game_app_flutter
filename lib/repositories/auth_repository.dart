import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/helper/managers/secure_storage_manager.dart';
import 'package:game_app/helper/managers/shared_preference_manager.dart';
import 'package:game_app/helper/network/network.dart';
import 'package:game_app/helper/network/network_post_methods.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/repositories/models/auth_models/facebook_user.dart';
import 'package:game_app/repositories/models/auth_models/google_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_in_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_up_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../helper/managers/authentication_manager.dart';
import '../helper/constants.dart';
import '../helper/error.dart';
import '../helper/managers/connectivity_manager.dart';

class AuthRepository {
  int? _getStatusCode(Map<String, dynamic> data) {
    return data["statusCode"] as int?;
  }

  Future<GoogleUser> googleAuthentication() async {
    bool internetStatus = await ConnectivityManager.shared.checkInternet();
    if (!internetStatus) {
      //no internet
      throw NoInternetException(Constants.internetErrorMessage);
    }
    try {
      final GoogleSignInAccount? user = await Auth.shared.googleSignIn();
      final GoogleSignInAuthentication? userAuthentication =
          await user?.authentication;
      return Future.value(GoogleUser(
          googleSignInAccount: user,
          googleSignInAuthentication: userAuthentication));
    } catch (error) {
      throw NetworkException(Constants.networkErrorMessage);
    }
  }

  Future<FacebookUser> facebookAuthentication() async {
    bool internetStatus = await ConnectivityManager.shared.checkInternet();
    if (!internetStatus) {
      //no internet
      throw NoInternetException(Constants.internetErrorMessage);
    }
    try {
      final LoginResult result = await Auth.shared.facebookSignIn();
      Map<String, dynamic>? userData;
      if (result.status == LoginStatus.success) {
        // you are logged in
        userData = await Auth.shared.facebookUserData();
      }
      return Future.value(FacebookUser(loginResult: result, email: userData?["email"] as String?, id: userData?["id"]));

    } catch (_) {
      throw NetworkException(Constants.networkErrorMessage);
    }
  }

  Future<bool> validateUser(
      String? email, String? password, ACCOUNT_TYPE type) async {
    //get the account type from storage
    List<String>? userData =
    await SharedPreference.shared.getValue(key: Constants.userValues);

    if (userData?[0] == type.name &&
        userData?[2] != null &&
        email == userData?[2]) {
      //previous signIn was with this account, just login and get token
      int code = await signInAccount(SignInUser(
          email: email, password: password, accountType: type.name));
      if (code == StatusCodes.statusCodeRequestSuccess) {
        return Future.value(true);
      }
    } else {
      //check registration
      int code = await signUpAccount(SignUpUser(
          name: email?.split('@')[0],
          email: email,
          password: password,
          accountType: type.name,
          deviceType: DEVICE_TYPE.mobile.text,
          phoneNumber: ""));

      //new user or user exist
      if (code == StatusCodes.statusCodeCreated ||
          code == StatusCodes.statusCodeUnProcessableEntity) {
        //login and get token
        int code = await signInAccount(SignInUser(
            email: email,
            password: password,
            accountType: type.name));
        if (code == StatusCodes.statusCodeRequestSuccess) {
          return Future.value(true);
        }
      }
    }
    return Future.value(false);
  }

  void _saveUserInfo(SignInUser? user, String token) {
    SecureStorage.shared.writeSecureData(Constants.token, token);
    //save user data to shared_preferences, user_defaults
    List<String> values = List.from([user?.accountType, user?.email?.split('@')[0] ?? "", user?.email]);
    SharedPreference.shared.setValue(key: Constants.userValues, value: values);
  }

  void removeUserInfo() {
    SecureStorage.shared.deleteSecureData(Constants.token);
    SharedPreference.shared.removeValue(key: Constants.userValues);
  }

  Future<int> signInAccount(SignInUser? user) async {
    Map<String, dynamic> data = await Net.shared.signIn(user);
    int? code = _getStatusCode(data);
    if (code == StatusCodes.statusCodeRequestSuccess) {
      Map<String, dynamic>? resData =
          Utils.shared.getJsonBody(data)?["data"] as Map<String, dynamic>?;
      String? token = resData?["token"] as String?;
      if (token != null) {
        //save jwt token to key_store, key_chain, save user info
        _saveUserInfo(user, token);
      }
    }
    return Future.value(code);
  }

  Future<int> signUpAccount(SignUpUser? user) async {
    Map<String, dynamic> data = await Net.shared.signUp(user);
    int? code = _getStatusCode(data);
    if (code == StatusCodes.statusCodeCreated) {}
    return Future.value(code);
  }

  Future<bool> signOutAccount() async {
    bool internetStatus = await ConnectivityManager.shared.checkInternet();
    if (!internetStatus) {
      //no internet
      throw NoInternetException(Constants.internetErrorMessage);
    }
    try {
      //get the account type from storage
      List<String>? userValues = await SharedPreference.shared
          .getValue(key: Constants.userValues) as List<String>?;
      //index 0 is accountType
      switch (userValues?[0]) {
        case Constants.google:
          //google sign out
          await Auth.shared.googleSignOut();
          return Future.value(true);
        case Constants.facebook:
          //facebook sign out
          await Auth.shared.facebookSignOut();
          return Future.value(true);
        case Constants.email:
          //email sign out
          return Future.value(true);
        default:
          return Future.value(false);
      }
    } catch (_) {
      throw NetworkException(Constants.networkErrorMessage);
    }
  }
}
