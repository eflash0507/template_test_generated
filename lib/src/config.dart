import 'package:flutter/material.dart';

const String _env = String.fromEnvironment('ENV', defaultValue: 'prod');

class Config {
  static bool get isDev     => _env == 'dev';
  static bool get isStaging => _env == 'staging';
  static bool get isProd    => _env == 'prod';

  /// Banner label
  static String get bannerLabel {
    if (isDev) return 'DEV';
    if (isStaging) return 'STAGING';
    return 'PROD';
  }

  static Color get bannerColor {
    if (isDev) return Colors.green;
    if (isStaging) return Colors.orange;
    return Colors.red;
  }

  // --- 1) Chemins i18n ---
  // Permet à flutter_translate de charger les bons JSON selon ENV
  static String get i18nBasePath {
    if (isDev)     return 'assets/i18n/dev/';
    if (isStaging) return 'assets/i18n/staging/';
    return 'assets/i18n/prod/';
  }

  /// URL SEO pour chaque environnement
  static String get mainPageLinkTagCanonical {
    if (isDev)     return 'https://template-test-dev.web.app/';
    if (isStaging) return 'https://template-test-staging.web.app/';
    return 'https://template-test-prod-d8d6b.web.app/';
  }

  static String get mainPageLinkTagAlternateEN {
    // English version
    return '${mainPageLinkTagCanonical}en/';
  }

  static String get mainPageLinkTagAlternateFR {
    // French version
    return '${mainPageLinkTagCanonical}fr/';
  }

  static String get mainPageLinkTagAlternateDefault => mainPageLinkTagCanonical;

  /// Profils sociaux
  static String get youtubeLink   => 'https://www.youtube.com/votreChannel';
  static String get instagramLink => 'https://www.instagram.com/votreCompte';
  static String get tiktokLink    => 'https://www.tiktok.com/@votreCompte';

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
