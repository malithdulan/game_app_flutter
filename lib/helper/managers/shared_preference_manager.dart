import '../log.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  //singleton implementation
  SharedPreference._privateConstructor(); //private constructor
  static SharedPreference? _shared; //shared instance
  static SharedPreference get shared {
    _shared ??= SharedPreference._privateConstructor();
    return _shared!;
  }

  // only have a single app-wide reference to the persistent storage
  static SharedPreferences? _prefs;
  Future<SharedPreferences?> get prefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  ///get data from the persistent storage.
  Future<List<String>?> getValue({required String key}) async {
    try {
      final SharedPreferences? sp = await shared.prefs;
      return sp?.getStringList(key);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Data persistent error",
          className: "SharedPreferenceManager - getData()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///set data to the persistent storage.
  ///
  ///supported types - int, String, double, bool, List<String>.
  ///
  ///if value stored with existing key, it's gonna update the value of that key
  ///
  ///if succeeded, returns true.
  Future<bool?> setValue<T>({required String key, required T? value}) async {
    try {
      final SharedPreferences? sp = await shared.prefs;
      if (value == null) return null;
      if (value is int) {
        //if data type equals to int. another wary of checking  data.runtimeType == int
        return sp?.setInt(key, value);
      } else if (value is double) {
        return sp?.setDouble(key, value);
      } else if (value is bool) {
        return sp?.setBool(key, value);
      } else if (value is String) {
        return sp?.setString(key, value);
      } else if (value is List<String>) {
        return sp?.setStringList(key, value);
      } else {
        Log.shared.logWarning(
            message:
                "T is not in any type that is defined in the setData() method",
            className: "SharedPreferenceManager - setData()");
        return null;
      }
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Data persistent error",
          className: "SharedPreferenceManager - setData()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///check whether the key is available in the persistent storage.
  Future<bool?> isContainKey({required String key}) async {
    try {
      final SharedPreferences? sp = await shared.prefs;
      return sp?.containsKey(key);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Data persistent error",
          className: "SharedPreferenceManager - isContainKey()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///Returns all keys in the persistent storage.
  Future<Set<String>?> getAllKeys() async {
    try {
      final SharedPreferences? sp = await shared.prefs;
      return sp?.getKeys();
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Data persistent error",
          className: "SharedPreferenceManager - getAllKeys()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///Removes an entry from persistent storage.
  ///if succeeded, returns true.
  Future<bool?> removeValue({required String key}) async {
    try {
      final SharedPreferences? sp = await shared.prefs;
      return sp?.remove(key);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Data persistent error",
          className: "SharedPreferenceManager - removeData()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///clear all data from the persistent storage.
  ///if succeeded, returns true.
  Future<bool?> clearAllValues() async {
    try {
      final SharedPreferences? sp = await shared.prefs;
      return sp?.clear();
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Data persistent error",
          className: "SharedPreferenceManager - clearData()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }
}
