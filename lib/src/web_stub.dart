// lib/src/web_stub.dart
/// Stub minimal pour la VM, afin que window.navigator.language compile en tests.
class Navigator {
  /// Langue par défaut dans vos tests (à adapter si besoin)
  String get language => 'en';
}

class Window {
  final Navigator navigator = Navigator();
}

/// On expose un top-level window identique à celui du DOM
final Window window = Window();