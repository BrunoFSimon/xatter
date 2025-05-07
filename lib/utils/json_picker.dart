import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xatter/utils/firebase_crashlytics.dart';

abstract class JsonPicker {
  static bool _isKeyPresent(Map<String, dynamic> json, String key) {
    if (json.containsKey(key) == false) {
      FirebaseCrashlytics.recordError(
        errorDescription: 'Field $key not found in json ${json.toString()}',
      );
      return false;
    }

    if (json[key] == null) {
      FirebaseCrashlytics.recordError(
        errorDescription: 'Field $key is null in json ${json.toString()}',
      );
      return false;
    }

    return true;
  }

  static bool _isStringValid(Map<String, dynamic> json, String key) {
    final isKeyPresent = _isKeyPresent(json, key);

    if (isKeyPresent == false) return false;

    final value = json[key];

    return value is String;
  }

  static bool _isIntValid(Map<String, dynamic> json, String key) {
    final isKeyPresent = _isKeyPresent(json, key);

    if (isKeyPresent == false) return false;

    final value = json[key];

    return value is int;
  }

  static bool _isTimeStampValid(Map<String, dynamic> json, String key) {
    final isKeyPresent = _isKeyPresent(json, key);

    if (isKeyPresent == false) return false;

    final value = json[key];

    return value is Timestamp;
  }

  static String getStringOrEmpty(Map<String, dynamic> json, String key) {
    final isValid = _isStringValid(json, key);

    return isValid ? json[key] : '';
  }

  static String getStringOrThrow(Map<String, dynamic> json, String key) {
    final isValid = _isStringValid(json, key);

    if (isValid == false) {
      throw Exception('Field $key not found in json ${json.toString()}');
    }

    return json[key] as String;
  }

  static String? getStringOrNull(Map<String, dynamic> json, String key) {
    final isValid = _isStringValid(json, key);

    return isValid ? json[key] : null;
  }

  static int getIntOrThrow(Map<String, dynamic> json, String key) {
    final isValid = _isIntValid(json, key);

    if (isValid == false) {
      throw Exception('Field $key not found in json ${json.toString()}');
    }

    return json[key] as int;
  }

  static int getIntOrZero(Map<String, dynamic> json, String key) {
    final isValid = _isIntValid(json, key);

    return isValid ? json[key] : 0;
  }

  static int? getIntOrNull(Map<String, dynamic> json, String key) {
    final isValid = _isIntValid(json, key);

    return isValid ? json[key] : null;
  }

  static Timestamp getTimestampOrThrow(Map<String, dynamic> json, String key) {
    final isValid = _isTimeStampValid(json, key);

    if (isValid == false) {
      throw Exception('Field $key not found in json ${json.toString()}');
    }

    final value = json[key];

    return value as Timestamp;
  }

  static Timestamp getTimestampOrZero(Map<String, dynamic> json, String key) {
    final isValid = _isTimeStampValid(json, key);

    if (isValid == false) {
      return Timestamp.fromMillisecondsSinceEpoch(0);
    }

    final value = json[key];

    return value as Timestamp;
  }

  static Timestamp? getTimestampOrNull(Map<String, dynamic> json, String key) {
    final isValid = _isTimeStampValid(json, key);

    if (isValid == false) {
      return null;
    }

    final value = json[key];

    return value as Timestamp;
  }

  static bool getBoolOrThrow(Map<String, dynamic> json, String key) {
    final isValid = _isKeyPresent(json, key);

    if (isValid == false) {
      throw Exception('Field $key not found in json ${json.toString()}');
    }

    return json[key] as bool;
  }

  static bool getBoolOrFalse(Map<String, dynamic> json, String key) {
    final isValid = _isKeyPresent(json, key);

    return isValid ? json[key] : false;
  }

  static bool? getBoolOrNull(Map<String, dynamic> json, String key) {
    final isValid = _isKeyPresent(json, key);

    return isValid ? json[key] : null;
  }
}
