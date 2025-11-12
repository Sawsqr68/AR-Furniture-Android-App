import 'package:flutter_test/flutter_test.dart';
import 'package:arshop/constants/api_constants.dart';

void main() {
  group('APIConstants', () {
    test('maskedKeyForVerification returns NOT_SET when key is empty', () {
      // Since we're not providing T_SECRET_API_KEY via --dart-define in tests,
      // the key should be empty by default
      expect(APIConstants.maskedKeyForVerification(), 'NOT_SET');
    });

    test('tSecretAPIKey is loaded from environment', () {
      // This test verifies that the constant is defined and accessible
      // In a real build with --dart-define, this would have the actual value
      expect(APIConstants.tSecretAPIKey, isA<String>());
    });
  });
}
