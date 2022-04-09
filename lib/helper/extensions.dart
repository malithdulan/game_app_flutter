import 'package:flutter/material.dart';

import 'enums.dart';

extension Loadingstatus on LOADING_STATUS {
  bool get isInitial => this == LOADING_STATUS.initial;
  bool get isSuccess => this == LOADING_STATUS.success;
  bool get isError => this == LOADING_STATUS.error;
  bool get isLoading => this == LOADING_STATUS.loading;
}

extension ThemeStatus on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
}
