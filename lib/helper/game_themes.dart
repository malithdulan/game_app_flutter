import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(
      secondary: Colors.deepOrange,
      primary: Colors.grey,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData(),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
        Colors.deepOrange,
      ),
      trackColor: MaterialStateProperty.all(
        Colors.black,
      ),
    ),
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
      primaryColor: Colors.deepOrange,
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      secondary: Colors.deepOrange,
      primary: Colors.white,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData(),
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
      barBackgroundColor: Colors.deepOrange,
      primaryColor: Colors.white,
    ),
  );

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.deepOrange,
        ),
      ),
    );
  }
}
