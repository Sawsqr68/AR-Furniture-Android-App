// Do NOT store secrets in source control.
// The API key is injected at build/runtime via --dart-define or a secrets manager.
class APIConstants {
  // Provide the secret at build time:
  // flutter run --dart-define=T_SECRET_API_KEY=your_key_here
  // or in CI: flutter build apk --dart-define=T_SECRET_API_KEY=${{ secrets.T_SECRET_API_KEY }}
  static const String tSecretAPIKey =
      String.fromEnvironment('T_SECRET_API_KEY', defaultValue: '');

  /// Returns a masked version of the key for verification (e.g. "*****d3f1").
  /// Safe to log for debugging as it does not reveal the full secret.
  static String maskedKeyForVerification() {
    final k = tSecretAPIKey;
    if (k.isEmpty) return '<MISSING>';
    final len = k.length;
    if (len <= 4) return List.filled(len, '*').join();
    final mask = List.filled(len - 4, '*').join();
    return '$mask${k.substring(len - 4)}';
  }
}