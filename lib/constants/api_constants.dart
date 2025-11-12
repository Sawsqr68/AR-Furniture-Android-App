// API Constants
//
// IMPORTANT: This file uses environment variables for sensitive API keys.
// The hardcoded API key has been removed for security reasons.
//
// To provide the API key at build time:
//
// For local development (flutter run):
//   flutter run --dart-define=T_SECRET_API_KEY=your_actual_key_here
//
// For production builds (flutter build):
//   flutter build apk --dart-define=T_SECRET_API_KEY=your_actual_key_here
//   flutter build ios --dart-define=T_SECRET_API_KEY=your_actual_key_here
//
// For CI/CD (GitHub Actions, etc.):
//   Store the key in repository secrets (e.g., T_SECRET_API_KEY)
//   Pass it during build:
//   flutter build apk --dart-define=T_SECRET_API_KEY=${{ secrets.T_SECRET_API_KEY }}
//
// Alternative: Use a .env file for local development (ensure .env is in .gitignore)
//
// SECURITY NOTES:
// 1. NEVER commit actual API keys to the repository
// 2. The previously exposed key (cwt_live_b2da6ds3df3e785v8ddc59198f7615ba) 
//    MUST be rotated/regenerated immediately in the provider dashboard
// 3. If this key appeared in git history, scrub it using BFG Repo-Cleaner 
//    or git-filter-repo before force-pushing

class APIConstants {
  // API key loaded from environment variable at compile time
  // Use --dart-define=T_SECRET_API_KEY=your_key to provide the value
  static const String tSecretAPIKey = String.fromEnvironment(
    'T_SECRET_API_KEY',
    defaultValue: '',
  );

  /// Returns a masked version of the API key for safe local verification.
  /// This helps developers confirm the key is loaded without exposing the full value.
  /// 
  /// Returns:
  /// - "NOT_SET" if the key is empty (not provided)
  /// - "****<last4>" if the key is 4 characters or less
  /// - "****<last4>" showing only the last 4 characters if the key is longer
  /// 
  /// Example output: "****15ba" for a properly configured key
  static String maskedKeyForVerification() {
    if (tSecretAPIKey.isEmpty) {
      return 'NOT_SET';
    }
    
    final trimmedKey = tSecretAPIKey.trim();
    if (trimmedKey.length <= 4) {
      return '****${trimmedKey}';
    }
    
    return '****${trimmedKey.substring(trimmedKey.length - 4)}';
  }
}