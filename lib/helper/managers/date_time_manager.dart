import 'package:intl/intl.dart';

import '../log.dart';

class CustomDate {
  //ISO-8601, toIso8601String()
  //The format is yyyy-MM-ddTHH:mm:ss.mmmuuuZ for UTC time, and yyyy-MM-ddTHH:mm:ss.mmmuuu (no trailing "Z") for local/non-UTC time, where:
  // yyyy is a, possibly negative, four digit representation of the year, if the year is in the range -9999 to 9999, otherwise it is a signed six digit representation of the year.
  // MM is the month in the range 01 to 12,
  // dd is the day of the month in the range 01 to 31,
  // HH are hours in the range 00 to 23,
  // mm are minutes in the range 00 to 59,
  // ss are seconds in the range 00 to 59 (no leap seconds),
  // mmm are milliseconds in the range 000 to 999, and
  // uuu are microseconds in the range 001 to 999. If microsecond equals 0, then this part is omitted.

  //singleton implementation
  CustomDate._privateConstructor(); //private constructor
  static CustomDate? _shared; //shared instance
  static CustomDate get shared {
    _shared ??= CustomDate._privateConstructor();
    return _shared!;
  }

  ///get dateString from timeStamp with a defined format (format can be change independently), set isUtc true to use UTC timezone or local will be taken.
  ///
  ///if isUtc = true, dateString will be in UTC dateTime or dateString will be local dateTime.
  String? dateStringFromTimeStamp(
      {required int? timeStamp, required String format, bool isUtc = false}) {
    try {
      if (timeStamp == null) return null;
      return DateFormat(format)
          .format(DateTime.fromMicrosecondsSinceEpoch(timeStamp, isUtc: isUtc));
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - dateStringFromTimeStamp()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get dateObject from timeStamp, set isUtc true to use UTC timezone or local will be taken.
  ///if isUtc = true, dateObject will be in UTC dateTime or dateObject will be local dateTime.
  DateTime? dateFromTimeStamp({required int? timeStamp, bool isUtc = false}) {
    try {
      if (timeStamp == null) return null;
      return DateTime.fromMicrosecondsSinceEpoch(timeStamp, isUtc: isUtc);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - dateFromTimeStamp()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get timeStamp from dateString, set isUtc true to use UTC timezone for the incoming dateString when convert to the dateObject or local will be taken
  int? timeStampFromDateString(
      {required String dateString,
      required String existingFormat,
      bool isUtc = false}) {
    try {
      final DateTime? date = dateFromDateString(
          dateString: dateString, existingFormat: existingFormat, isUtc: isUtc);
      if (date == null) return null;
      return date.microsecondsSinceEpoch;
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - timeStampFromDateString()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get timeStamp from dateObject
  int? timeStampFromDate({required DateTime? date}) {
    try {
      if (date == null) return null;
      return date.microsecondsSinceEpoch;
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - timeStampFromDate()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get a new dateString from a dateString with a new date format.
  ///existingFormat should be representation of dateString.
  ///newFormat is the expected dateString format.
  String? dateStringFromNewFormat(
      {required String? dateString,
      required String existingFormat,
      required String newFormat}) {
    try {
      if (dateString == null) return null;
      final DateTime? inputDate = dateFromDateString(
          dateString: dateString,
          existingFormat:
              existingFormat); //<-- Incoming date, convert dateString to dateObject
      return dateStringFromDate(
          date: inputDate,
          dateFormat:
              newFormat); // <-- Desired date, convert dateObject to dateString with new format
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - dateFromStringWithFormat()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get a new dateTime object from dateString, set isUtc true to use UTC timezone for the return dateObject or local will be taken, should give only the valid format that represent the dateString.
  ///
  ///return dateObject is in standard format, ex - 2000-12-31 23:59:00.000.
  ///
  ///use dateStringFromDate() method to get preferred dateString format.
  DateTime? dateFromDateString(
      {required String? dateString,
      required String existingFormat,
      bool isUtc = false}) {
    try {
      if (dateString == null) return null;
      return DateFormat(existingFormat).parse(dateString, isUtc);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - dateFromDateString()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get dateString from dateObject with format, can give any valid format.
  String? dateStringFromDate(
      {required DateTime? date, required String? dateFormat}) {
    try {
      if (date == null || dateFormat == null) return null;
      return DateFormat(dateFormat).format(date);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - dateStringFromDate()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }

  ///get dateObject from iso8601 string.
  DateTime? dateFromIso8601String({required String? isoString}) {
    try {
      if (isoString == null) return null;
      return DateTime.parse(isoString);
    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "Date format exception error",
          className: "DateTimeManager - dateFromIso8601String()",
          error: error.toString(),
          stackTrace: stackTrace);
    }
    return null;
  }
}
// var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000000);
// var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
//time stamp in seconds - 1619013650
//milie seconds 1000 - seconds 1
//microeconds 1000000 - seconds 1

//Your timestamp is in an ISO format. Examples: 1999-04-23, 1999-04-23 13:45:56Z, 19990423T134556.789. In this case, you can use DateTime.parse or DateTime.tryParse. (See the DateTime.parse documentation for the precise set of allowed inputs.)
// Your timestamp is in a standard HTTP format. Examples: Fri, 23 Apr 1999 13:45:56 GMT, Friday, 23-Apr-99 13:45:56 GMT, Fri Apr 23 13:45:56 1999. In this case, you can use dart:io's HttpDate.parse function.
// Your timestamp is in some local format. Examples: 23/4/1999, 4/23/99, April 23, 1999. You can use package:intl's DateFormat class and provide a pattern specifying how to parse the string:
