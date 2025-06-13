import 'package:flutter/foundation.dart';
///import 'package:web/web.dart' as web;
import 'package:template_test_generated/src/web_api.dart';

String detectLocale() {
  // Récupère la langue depuis l'API navigateur interop
  final String navLang = window.navigator.language;
  final String code = navLang.split('-').first.toLowerCase();

  // Définit les locales supportées
  const supported = ['en', 'fr'];
  return supported.contains(code) ? code : 'fr';
}

printf(msg) {
  if (kDebugMode) {
    print(msg);
  }
}