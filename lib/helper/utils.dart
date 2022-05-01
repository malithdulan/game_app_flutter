import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:game_app/helper/app_data.dart';
import 'package:game_app/helper/constants.dart';
import 'package:game_app/ui/pages/home/home_page.dart';

import 'package:game_app/ui/pages/sign_in/sign_in_page.dart';
import '../ui/pages/category_list/category_list_page.dart';
import '../ui/pages/game_details/game_details_page.dart';

import 'log.dart';
import 'managers/date_time_manager.dart';
import 'managers/secure_storage_manager.dart';

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
        //set important app data
        AppData.shared.setDeviceValues(context);
        //if user valid (jwt is valid), show home else login
        return (AppData.shared.isUserValid)
            ? const HomePage()
            : const SignInPage();
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

  //scale font size according to device size
  final Size _designLayoutSize =
      const Size(432, 816); //Pixel 3a XL API 30 (full height, width)
  double fScale(double value) {
    //font scale
    return (value / min(_designLayoutSize.height, _designLayoutSize.width)) *
        min(AppData.shared.dvfh, AppData.shared.dvw);
  }

  executeWithDelay({required FutureOr Function() callBack}) {
    Future.delayed(const Duration(seconds: 1), callBack);
  }

  //dark mode or not
  bool get isDark =>
      SchedulerBinding.instance?.window.platformBrightness == Brightness.dark;

  Map<String, dynamic>? getJsonBody(Map<String, dynamic> data) {
    return data["body"] as Map<String, dynamic>?;
  }

  showErrorToastMessage(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message ?? "",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red,
    ));
  }

  String? validationCheck(
      {required String name,
      String? value,
      String? regex,
      String? passwordText}) {
    if (value == null || value.isEmpty) {
      return (name == Constants.confirmPassword)
          ? "Please $name"
          : "Please Enter $name";
    }

    //regex validation
    if (regex != null && !RegExp(regex).hasMatch(value)) {
      return "$name Not Valid";
    }

    //password and confirm password check
    if (passwordText != null && passwordText != value) {
      return Constants.passwordMissMatch;
    }

    return null;
  }

  ///check whether the jwt is valid or not (EXPIRY)
  Future<bool> get checkJWT async {
    try {
      String? jwt = await SecureStorage.shared.readSecureData(Constants.token);
      if (jwt == null) return false;

      Map<String, dynamic> payload = json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1]))));

      if (payload.containsKey("exp") && payload["exp"] != null) {
        int expTimeStamp = payload["exp"] as int;
        DateTime? expiryDate = CustomDate.shared
            .dateFromTimeStamp(timeStamp: expTimeStamp * 1000000);
        if (expiryDate == null) return false;
        if (DateTime.now().compareTo(expiryDate) < 0) return true;
      }

      return false;
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "JWT calculation error",
          className: "Auth - checkJWT",
          error: error.toString(),
          stackTrace: stackTrace);
      return false;
    }
  }

  double keyboardHeightPercentage(BuildContext context) {
    return ((MediaQuery.of(context).viewInsets.bottom /
                MediaQuery.of(context).size.height) *
            100) +
        2;
  }

  showConfirmDialog(BuildContext context, Function okCallback) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sign Out"),
          content: const Text("Do you want to Sign Out?"),
          actions: [
            TextButton(
              child: const Text("Cancel",
                  style: TextStyle(color: Colors.deepOrange)),
              onPressed: () {
                Navigator.pop(context);
              },
              style: Theme.of(context).textButtonTheme.style,
            ),
            TextButton(
              child:
                  const Text("Ok", style: TextStyle(color: Colors.deepOrange)),
              onPressed: () => okCallback(),
            ),
          ],
        );
      },
    );
  }
}
