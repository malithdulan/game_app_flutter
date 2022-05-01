import 'package:flutter/cupertino.dart';
import 'package:game_app/ui/global_widgets/carousel_image.dart';

class StatusCodes {
  // MARK: - Network status codes/error codes
  static const int errorCodeRequestTimeout = 408;
  static const int statusCodeUnProcessableEntity = 422;
  static const int statusCodeCreated = 201;
  // static const int ERROR_CODE_NETWORK_CONNECTION_LOST = -1005;
  // static const int ERROR_CODE_INTERNET_OFFLINE = -1009;
  static const int statusCodeRequestSuccess = 200;
  //static const int STATUS_CODE_REQUEST_SUCCESS_START = 200...299;
  static const int statusCodeForbidden = 403;
  static const int statusCodeUnauthorized = 401;
  static const int statusCodeServerError = 500;
  //static const int STATUS_CODE_SERVER_ERROR_RANGE = 500...599
  static const int statusCodeServerGatewayTimeout = 504;
}

class AssetImageUrls {
  static List<Widget> categorySlider = [
    const CarouselImage(image: AssetImage("assets/images/bf2048.jpg")),
    const CarouselImage(image: AssetImage("assets/images/gta.png")),
    const CarouselImage(image: AssetImage("assets/images/c2.jpg")),
    const CarouselImage(image: AssetImage("assets/images/cd1.jpg")),
    const CarouselImage(image: AssetImage("assets/images/gd.jpg")),
  ];
  static List<Widget> gameSlider = [
    const CarouselImage(image: AssetImage("assets/images/farcry2.jpg")),
    const CarouselImage(image: AssetImage("assets/images/farcry3.jpg")),
    const CarouselImage(image: AssetImage("assets/images/farcry4.jpg")),
    const CarouselImage(image: AssetImage("assets/images/farcry5.jpg")),
    const CarouselImage(image: AssetImage("assets/images/newdawn.jpg")),
  ];

  static String errorWidgetImage = "assets/images/office.jpg";
}

class Constants {
  static String defaultUrl =
      "https://media.rawg.io/media/games/26d/26d4437715bee60138dab4a7c8c59c92.jpg";

  //error messages
  static const String internetErrorMessage = "Ops! no internet connection.";
  static const String internetCheckErrorMessage =
      "Ops! something went wrong with internet check.";
  static const String networkErrorMessage = "Ops! something went wrong.";
  static const String clientErrorMessage = "Ops! error in client side.";
  static const String unauthorizedAccessErrorMessage =
      "Ops! unauthorized access.";
  static const String contentNotFoundErrorMessage = "Ops! content not found.";
  static const String serverErrorMessage = "Ops! error in server side.";
  static const String wrongCredentials = "Wrong credentials.";
  static const String userExists = "User already registered.";
  static const String googleAuthFail = "Google authentication filed!";
  static const String facebookAuthFail = "Facebook authentication filed!";
  static const String somethingWrong = "Ops! something went wrong";

  //storage error messages
  static const String userDataStorageError =
      "Couldn't retrieve data from storage!";

  //other errors
  static const String appSettingsError = "Couldn't get app settings!";

  //validation messages
  static const String emptyEmail = "Email";
  static const String emptyPassword = "Password";
  static const String confirmPassword = "Confirm Password";
  static const String passwordMissMatch = "Password Doesn't Match";
  static const String emptyPhoneNumber = "Phone Number";

  //formField text messages
  static const String textEmail = "Email";
  static const String textPassword = "Password";
  static const String textConfirmPassword = "Confirm Password";
  static const String textPhoneNumber = "+94716948293";

  //regex validation strings
  static const emailRegex = r'\S+@\S+\.\S+';
  static const phoneNumberRegex = '^(?:[+0]9)?[0-9]{10}\$';
  static const passwordRegex =
      '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$';

  //storage keys
  static const token = "token"; //key store, key chain
  static const name = "name"; //shared_preferences, user_defaults
  static const email = "email"; //shared_preferences, user_defaults
  static const phone = "phone"; //shared_preferences, user_defaults
  static const accountType = "account_type"; //shared_preferences, user_defaults

  //account types
  static const google = "google";
  static const facebook = "facebook";
}
