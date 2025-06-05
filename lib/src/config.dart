// lib/src/config.dart

/// Récupère la valeur définie lors du build : --dart-define=ENV=...
const String _env = String.fromEnvironment('ENV', defaultValue: 'prod');

class Config {
  static bool get isDev => _env == 'dev';
  static bool get isStaging => _env == 'staging';
  static bool get isProd => _env == 'prod';

  /// Exemple : URL de base pour charger les fichiers JSON d’i18n selon l’environnement
  static String get i18nBaseUrl {
    if (isDev) {
      return 'https://storage.googleapis.com/mon-app-dev.appspot.com/assets/i18n/';
    }
    if (isStaging) {
      return 'https://storage.googleapis.com/mon-app-staging.appspot.com/assets/i18n/';
    }
    return 'https://storage.googleapis.com/mon-app-prod.appspot.com/assets/i18n/';
  }

  /// Exemple de fonction pour obtenir le chemin complet d’un JSON i18n
  static String i18nFilePath(String langCode) {
    return '$i18nBaseUrl$langCode.json';
  }

  /// Exemple : URL de base pour appeler votre API. À adapter selon vos besoins.
  static String get apiBaseUrl {
    if (isDev) {
      return 'https://api-dev.mon-domaine.com/';
    }
    if (isStaging) {
      return 'https://api-staging.mon-domaine.com/';
    }
    return 'https://api.mon-domaine.com/';
  }
}
