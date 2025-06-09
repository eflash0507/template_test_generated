import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:template_test_generated/main.dart';
import 'package:template_test_generated/src/config.dart';

void main() {
  // 1. Nécessaire si on fait des appels async avant pumpWidget
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 2. Création du delegate de traduction (même config que dans main.dart)
    final delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      supportedLocales: ['en', 'fr'],
      basePath: Config.i18nBasePath,
    );

    // 3. Monte l’arbre de widgets : on enveloppe MyApp dans LocalizedApp
    await tester.pumpWidget(
      LocalizedApp(
        delegate,
        const MyApp(),
      ),
    );

    // 4. Attend la fin de toute animation/initialisation asynchrone
    await tester.pumpAndSettle();

    // 5. À présent le widget tree est construit, on doit trouver '0'
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // 6. On tape sur le bouton + et on rebuild
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 7. On vérifie que le compteur est bien passé à 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
