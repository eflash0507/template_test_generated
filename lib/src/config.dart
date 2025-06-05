// lib/src/config.dart
const String _env = String.fromEnvironment('ENV', defaultValue: 'prod');

class Config {
  static bool get isDev     => _env == 'dev';
  static bool get isStaging => _env == 'staging';
  static bool get isProd    => _env == 'prod';

  // --- 1) Chemins i18n ---
  // Permet à flutter_translate de charger les bons JSON selon ENV
  static String get i18nBasePath {
    if (isDev)     return 'assets/i18n/dev/';
    if (isStaging) return 'assets/i18n/staging/';
    return 'assets/i18n/prod/';
  }

  // --- 2) API / Services ---
  static String get apiBaseUrl {
    if (isDev)     return 'https://api-dev.mon-exemple.com/';
    if (isStaging) return 'https://api-staging.mon-exemple.com/';
    return 'https://api.mon-exemple.com/';
  }

  // --- 3) Bucket Firebase Storage (ou autre service) ---
  static String get firebaseBucket {
    if (isDev)     return 'mon-app-dev.appspot.com';
    if (isStaging) return 'mon-app-staging.appspot.com';
    return 'mon-app-prod.appspot.com';
  }

  // --- 4) Flags / Feature toggles ---
  static bool get enableCrashlytics => isProd; // on n’active Crashlytics qu’en PROD
  static bool get showDebugBanner   => isDev;  // n’affiche le bandeau “DEBUG” qu’en DEV

  // --- 5) Exemple d’URL de téléchargement d’un PDF ---
  static String get pdfUserGuideUrl {
    if (isDev) {
      return 'https://storage.googleapis.com/\$firebaseBucket/temp/guide_dev.pdf';
    }
    if (isStaging) {
      return 'https://storage.googleapis.com/\$firebaseBucket/temp/guide_staging.pdf';
    }
    return 'https://storage.googleapis.com/\$firebaseBucket/temp/guide_prod.pdf';
  }
}
