import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:seo/seo.dart';
import 'package:template_test_generated/src/config.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:template_test_generated/src/functions.dart';
import 'package:template_test_generated/src/seo_datas.dart';
import 'package:template_test_generated/widgets/seo_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // recuperate la language passe via --dart-define=LOCALE
  /// const String localeEnv = String.fromEnvironment('LOCALE', defaultValue: 'en');
  final localeEnv = detectLocale();
  printf("env local language IS >>> $localeEnv");
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: localeEnv,
    supportedLocales: ['en', 'fr'],
    basePath: Config.i18nBasePath,  // <- ici, on passe Config.i18nBasePath
  );
  usePathUrlStrategy();  // permit à Google de voir chaque route comme une page distincte
  runApp(LocalizedApp(delegate, MyApp(locale: localeEnv)));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return SeoController(
      enabled: true,                                 // désactivez si user loggé, testé, etc.
      tree: WidgetTree(context: context),            // parcours du widget tree
      child:SeoHead(
        tags: seoHead,
        child: SeoHtml(
          html: jsonLdOrganization,
          child: MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                localizationDelegate,
              ],

              supportedLocales: localizationDelegate.supportedLocales,
              locale: localizationDelegate.currentLocale,
              scrollBehavior: const CupertinoScrollBehavior(),
              debugShowCheckedModeBanner: false,
              initialRoute: "/$locale",
              routes: {
                '/en': (_) => MyHomePage(),
                '/fr': (_) => MyHomePage(),
                '/': (_) => MyHomePage(),
              },
              title: translate('seo_test.appTitleForCtrSERP')
          ),
        )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(translate('seo_test.appTitleForCtrSERP')),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () => _onActionSheetPress(context),
            tooltip: translate('button.change_language'),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // H1
            SeoText(
              text: 'Template Flutter Web Multilingue & Full SEO',
              textAlign: TextAlign.center,
              maxLines: 2,
              tagStyle: TextTagStyle.h1,
            ),
            // H2
            SeoText(
              text: 'Fonctionnalités Clés',
              tagStyle: TextTagStyle.h2,
            ),

            // H3
            SeoText(
              text: 'Internationalisation & i18n',
              tagStyle: TextTagStyle.h3,
            ),

            // H4
            SeoText(
              text: 'Optimisation SEO Dynamique',
              tagStyle: TextTagStyle.h4,
            ),

            // H5
            SeoText(
              text: 'PWA & Déploiement Firebase',
              tagStyle: TextTagStyle.h5,
            ),

            // H6
            SeoText(
              text: 'A Propos de ce Template',
              tagStyle: TextTagStyle.h6,
            ),

          ],
        ),
      ),
    );
  }

  Future<void> actionSheet({
    required BuildContext context,
    required Widget child,
  }) async {
    // Lance action sheet et attends le result
    final String? value = await showCupertinoModalPopup<String>(
      context: context,
      builder: (_) => child,
    );

    // Si, entre-temps, ce State n'est plus monté, on sort
    if (!context.mounted) return;

    // Si l'utilisateur a choisi une langue, on la change
    if (value != null) {
      changeLocale(context, value);
    }
  }

  void _onActionSheetPress(BuildContext context) {
    actionSheet(
        context: context,
        child: Container(
          color: Colors.transparent,/// Theme.of(context).textTheme.titleLarge?.color,
          child: CupertinoActionSheet(
            title: Text(translate('language.selection.title'),style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color,),),
            message: Text(translate('language.selection.message'),style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color,),),
            actions: <Widget>[
              Container(
                color: Theme.of(context).textTheme.titleLarge?.color,
                child:CupertinoActionSheetAction(
                  child: Text(translate('language.name.en')),
                  onPressed: () => Navigator.pop(context, 'en_US'),
                ),
              ),
              Container(
                color: Theme.of(context).textTheme.titleLarge?.color,
                child:CupertinoActionSheetAction(
                  child: Text(translate('language.name.fr')),
                  onPressed: () => Navigator.pop(context, 'fr_FR'),
                ),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context, null),
              child: Text(translate('button.cancel'),style: TextStyle(color: Colors.red),),
            ),
          ),
        )
    );
  }
}
