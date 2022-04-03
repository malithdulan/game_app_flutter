import 'package:flutter/cupertino.dart';
import 'package:game_app/ui/global_widgets/carousel_image.dart';

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
}