import 'dart:async';

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
        AppData.shared.setDeviceValues(context);//set important app data
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


  executeWithDelay({required FutureOr  Function() callBack}) {
    Future.delayed(const Duration(seconds: 1), callBack);
  }

}



