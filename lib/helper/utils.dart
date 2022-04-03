import 'package:flutter/material.dart';
import 'package:game_app/helper/app_data.dart';
import 'package:game_app/helper/constants.dart';
import 'package:game_app/ui/pages/home/home_page.dart';

import '../ui/pages/category_list/category_list_page.dart';
import '../ui/pages/game_details/game_details_page.dart';

import 'log.dart';

class Utils {
  //singleton implementation
  Utils._privateConstructor(); //private constructor
  static Utils? _shared; //shared instance
  static Utils get shared {
    //can use - Utils.shred.getColorFromHex("");
    _shared ??= Utils._privateConstructor();
    return _shared!;
  }

  ///log network response data with logger
  displayResponseData(int? statusCode, String? body) {
    if (statusCode != null) {
      if (statusCode == StatusCodes.statusCodeRequestSuccess) {
        Log.shared.logInfo(
            message:
                "Status Code - $statusCode - network operation is succeeded${body != null ? "\n\n$body" : ""}");
      } else if (statusCode == StatusCodes.statusCodeForbidden) {
        Log.shared.logWarning(
            message:
                "Status Code - $statusCode - network operation is forbidden${body != null ? "\n\n$body" : ""}");
      } else if (statusCode == StatusCodes.statusCodeUnauthorized) {
        Log.shared.logWarning(
            message:
                "Status Code - $statusCode - network operation is unauthorized${body != null ? "\n\n$body" : ""}");
      } else if (statusCode == StatusCodes.statusCodeServerError) {
        Log.shared.logError(
            message:
                "Status Code - $statusCode - Error from the server side${body != null ? "\n\n$body" : ""}");
      } else if (statusCode == StatusCodes.statusCodeServerGatewayTimeout) {
        Log.shared.logWarning(
            message:
                "Status Code - $statusCode - Server gateway timeout${body != null ? "\n\n$body" : ""}");
      } else if (statusCode == StatusCodes.errorCodeRequestTimeout) {
        Log.shared.logWarning(
            message:
                "Status Code - $statusCode - Request timeout${body != null ? "\n\n$body" : ""}");
      } else if (statusCode.clamp(200, 299) == statusCode) {
        Log.shared.logInfo(
            message:
                "Status Code - $statusCode - request success${body != null ? "\n\n$body" : ""}");
      } else if (statusCode.clamp(500, 599) == statusCode) {
        Log.shared.logError(
            message:
                "Status Code - $statusCode - server error${body != null ? "\n\n$body" : ""}");
      }
    }
  }

  Map<String, Widget Function(BuildContext)> routeList() {
    return {
      CategoryListPage.name: (context) => const CategoryListPage(),
      GameDetailsPage.name: (context) => const GameDetailsPage(),
    };
  }

  MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        AppData.shared.setDeviceValues(context);
        return const HomePage(); //home page (tab bar page)
      },
      settings: settings,
    );
  }

  //percent partial height (height without bottom navigation panel height in percentage)
  double percentPH(double value) {
    //value should be between 0 to 100
    return (AppData.shared.dvph - 50) * (value / 100); //50 tabBar height
  }

  double percentW(double value) {
    return AppData.shared.dvw * (value / 100);
  }

  Widget gamesImageCard({ImageProvider? image, Widget? child}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        image: (image != null) ? DecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black12,
            BlendMode.darken,
          ),
        ) : null,
        boxShadow: const [
          BoxShadow(blurRadius: 5),
        ],
      ),
      child: child,
    );
  }

  Widget gameListImageCard({ImageProvider? image, Widget? child}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        image: (image != null) ? DecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black12,
            BlendMode.darken,
          ),
        ) : null,
      ),
      child: child,
    );
  }

  Widget categoryItemCircle({ImageProvider? image, Widget? child, required bool state}) {
    return Container(
      width: state
          ? Utils.shared.percentW(20)
          : Utils.shared.percentW(18),
      height: state
          ? Utils.shared.percentW(20)
          : Utils.shared.percentW(18),
      decoration: BoxDecoration(
        image: (image != null) ? DecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: state ? const ColorFilter.mode(
            Colors.black12,
            BlendMode.lighten,
          ) : const ColorFilter.mode(
            Colors.black45,
            BlendMode.darken,
          ),
        ) : null,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(blurRadius: 5),
        ],
      ),
      child: child,
    );
  }

  Widget sliderImage(ImageProvider image) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3),
                BlendMode.darken),
            image: image,
          )
      ),
    );
  }


}



