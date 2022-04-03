import 'package:flutter/cupertino.dart';

class AppData {
  //singleton implementation
  AppData._privateConstructor(); //private constructor
  static AppData? _shared; //shared instance
  static AppData get shared {
    _shared ??= AppData._privateConstructor();
    return _shared!;
  }

  late double dvh;//device height without statusBar height and bottom navigation panel height
  late double dvw;//device width
  late double dvph;//device height without bottom navigation panel height (device partial height)


  void setDeviceValues(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    double bottomNavHeight = MediaQuery.of(context).viewPadding.bottom;
    //print("original $deviceHeight");
    dvh = deviceHeight - (statusBarHeight + bottomNavHeight);

    dvph = deviceHeight - bottomNavHeight;
    //print("partial $dvph");
    dvw = MediaQuery.of(context).size.width;
    //print(dvh);
  }

}