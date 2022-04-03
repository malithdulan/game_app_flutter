import 'package:logging/logging.dart';

class Log {
  //singleton implementation
  Log._privateConstructor();//private constructor
  static Log? _shared;//shared instance
  static Log get shared {
    _shared ??= Log._privateConstructor();
    return _shared!;
  }

  // only have a single app-wide reference to the Logger
  static Logger? _logger;
  Logger? get logger {
    _logger ??= Logger("Game App Logger");
    return _logger;
  }

  String? _getMessage({String? className, required String message}) {
    return className != null ? "[$className] - $message" : message;
  }

  ///disable logger if production.
  configLogger() {
    (const bool.fromEnvironment('dart.vm.product')) ? Logger.root.level = Level.OFF : Logger.root.level = Level.ALL;
  }

  ///log info details into the console.
  logInfo({String? className, required String message}) {
    shared.logger?.info(_getMessage(className: className, message: message) ?? "");
  }

  ///log warning details into the console.
  logWarning({String? className, required String message}) {
    shared.logger?.warning(_getMessage(className: className, message: message) ?? "");
  }

  ///log error details into the console.
  logError({String? className, required String message, String? error, StackTrace? stackTrace}) {
    shared.logger?.severe(_getMessage(className: className, message: message) ?? "", error ?? "", stackTrace);
  }

}