import 'package:flutter_test/flutter_test.dart';
import 'package:xatter/utils/json_picker.dart';

void main() {
  group('test string picker', () {
    test('should return empty string', () {
      final result = JsonPicker.getStringOrEmpty({}, 'key');
      expect(result, '');
    });

    test('should return "Bruno"', () {
      final result = JsonPicker.getStringOrEmpty({'key': 'Bruno'}, 'key');
      expect(result, 'Bruno');
    });

    test('should return null', () {
      final result = JsonPicker.getStringOrNull({}, 'key');
      expect(result, null);
    });

    test('should return "Bruno"', () {
      final result = JsonPicker.getStringOrNull({'key': 'Bruno'}, 'key');
      expect(result, 'Bruno');
    });

    test('should return "Bruno"', () {
      final result = JsonPicker.getStringOrThrow({'key': 'Bruno'}, 'key');
      expect(result, 'Bruno');
    });

    test('should throw an exception', () {
      expect(
        () => JsonPicker.getStringOrThrow({}, 'key'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('test int picker', () {
    test('should return 0', () {
      final result = JsonPicker.getIntOrZero({}, 'key');
      expect(result, 0);
    });

    test('should return 10', () {
      final result = JsonPicker.getIntOrZero({'key': 10}, 'key');
      expect(result, 10);
    });

    test('should return null', () {
      final result = JsonPicker.getIntOrNull({}, 'key');
      expect(result, null);
    });

    test('should return 10', () {
      final result = JsonPicker.getIntOrNull({'key': 10}, 'key');
      expect(result, 10);
    });

    test('should return 10', () {
      final result = JsonPicker.getIntOrThrow({'key': 10}, 'key');
      expect(result, 10);
    });

    test('should throw an exception', () {
      expect(
        () => JsonPicker.getIntOrThrow({}, 'key'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
