import '../log.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///set minsdk to 18 in android/app/src/bild.gradle in order to use secure storage, only supported 18 and above.
class SecureStorage {
  //singleton implementation
  SecureStorage._privateConstructor(); //private constructor
  static SecureStorage? _shared; //shared instance
  static SecureStorage get shared {
    _shared ??= SecureStorage._privateConstructor();
    return _shared!;
  }

  // only have a single app-wide reference to the secure storage
  static FlutterSecureStorage? _storage;
  FlutterSecureStorage? get storage {
    _storage ??= const FlutterSecureStorage();
    return _storage;
  }

  ///this method can update the value, if value is given with the existing key.
  ///write data to the secure storage.
  Future<void> writeSecureData(String key, String value) async {
    try {
      await shared.storage?.write(key: key, value: value);
    } catch (error, stackTrace) {
      Log.shared.logError(
        message: "Data storing exception error with secure storage",
        className: "SecureStorageManager - writeSecureData()",
        error: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  ///read data from the secure storage.
  Future<String?> readSecureData(String key) async {
    try {
      return await shared.storage?.read(key: key);
    } catch (error, stackTrace) {
      Log.shared.logError(
        message: "Data reading exception error with secure storage",
        className: "SecureStorageManager - readSecureData()",
        error: error.toString(),
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  ///delete data from the secure storage.
  Future<void> deleteSecureData(String key) async {
    try {
      await shared.storage?.delete(key: key);
    } catch (error, stackTrace) {
      Log.shared.logError(
        message: "Data deleting exception error with secure storage",
        className: "SecureStorageManager - deleteSecureData()",
        error: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  ///read all the data from the secure storage.
  Future<Map<String, String>?> readAllSecureData() async {
    try {
      return await shared.storage?.readAll();
    } catch (error, stackTrace) {
      Log.shared.logError(
        message: "Data reading exception error with secure storage",
        className: "SecureStorageManager - readAllSecureData()",
        error: error.toString(),
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  ///delete all the data from the secure storage.
  Future<void> deleteAllSecureData() async {
    try {
      await shared.storage?.deleteAll();
    } catch (error, stackTrace) {
      Log.shared.logError(
        message: "Data deleting exception error with secure storage",
        className: "SecureStorageManager - deleteAllSecureData()",
        error: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
