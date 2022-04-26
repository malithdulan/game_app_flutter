import 'package:flutter/cupertino.dart';

class AppData {
  //singleton implementation
  AppData._privateConstructor(); //private constructor
  static AppData? _shared; //shared instance
  static AppData get shared {
    _shared ??= AppData._privateConstructor();
    return _shared!;
  }

  late double
      dvh; //device height without statusBar height and bottom navigation panel height
  late double dvw; //device width
  late double dvfh; //device full height
  late double
      dvph; //device height without system bottom navigation panel height (device partial height)
  late Size deviceSize; //device full size regardless of safe areas

  void setDeviceValues(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double bottomNavHeight = MediaQuery.of(context).viewPadding.bottom;

    dvfh = deviceHeight;

    dvh = deviceHeight - (statusBarHeight + bottomNavHeight);

    dvph = deviceHeight - bottomNavHeight;

    dvw = MediaQuery.of(context).size.width;

    deviceSize = MediaQuery.of(context).size;
  }

  //valid user, jwt is active
  late bool isUserValid;
  void setUserStatus(value) {
    isUserValid = value;
  }
}
