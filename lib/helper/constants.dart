class StatusCodes {
  // MARK: - Network status codes/error codes
  static const int errorCodeRequestTimeout = 408;
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
  static List<String> categorySlider = [
    "assets/images/bf2048.jpg"
    "assets/images/gta.png"
    "assets/images/c2.jpg"
    "assets/images/cd1.jpg"
    "assets/images/gd.jpg"
  ];
  static List<String> gameSlider = [
    "assets/images/farcry2.jpg"
    "assets/images/farcry3.jpg"
    "assets/images/farcry4.jpg"
    "assets/images/farcry5.jpg"
    "assets/images/newdawn.jpg"
  ];
}