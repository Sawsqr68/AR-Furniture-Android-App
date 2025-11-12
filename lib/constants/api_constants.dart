// API Constants
//
// Security Notice:
// The API key is NOT hardcoded in this file. It must be provided at build time.
//
// Usage:
// 1. For local development:
//    flutter run --dart-define=T_SECRET_API_KEY=your_new_key_here
//    flutter build apk --dart-define=T_SECRET_API_KEY=your_new_key_here
//
// 2. For CI/CD (GitHub Actions):
//    Store the secret as T_SECRET_API_KEY in GitHub repository secrets.
//    In your workflow file:
//    flutter build apk --dart-define=T_SECRET_API_KEY=${{ secrets.T_SECRET_API_KEY }}
//
// 3. Alternative: Use flutter_dotenv package with .env file (never commit .env)
//
// Important: If the old hardcoded key appeared in git history, it is compromised.
// Rotate the key immediately in your provider dashboard and consider scrubbing
// git history using BFG Repo-Cleaner or git-filter-repo.

class APIConstants {
  // Retrieve API key from environment variable at compile time
  // Returns empty string if not provided
  static const String tSecretAPIKey = String.fromEnvironment(
    'T_SECRET_API_KEY',
    defaultValue: '',
  );

  // Returns a masked version of the API key for verification purposes
  // Shows only the last 4 characters, e.g., "*****d3f1"
  // This allows developers to verify they're using the correct key without exposing it
  static String maskedKeyForVerification() {
    if (tSecretAPIKey.isEmpty) {
      return '(not set)';
    }
    if (tSecretAPIKey.length <= 4) {
      return '****';
    }
    final lastFour = tSecretAPIKey.substring(tSecretAPIKey.length - 4);
    return '*****$lastFour';
  }
}