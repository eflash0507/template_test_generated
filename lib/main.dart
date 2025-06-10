import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:seo/head_tag.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:seo/html/tree/widget_tree.dart';
import 'package:seo/seo.dart';
import 'package:template_test_generated/src/config.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:template_test_generated/src/variables.dart';
import 'package:template_test_generated/widgets/seo_helpers.dart';
import 'package:web/web.dart' as web;

String detectLocale() {
  // Récupère la langue depuis l'API navigateur interop
  final String navLang = web.window.navigator.language;
  final String code = navLang.split('-').first.toLowerCase();

  // Définit les locales supportées
  const supported = ['en', 'fr'];
  return supported.contains(code) ? code : 'en';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // récupère la langue passée via --dart-define=LOCALE
  /// const String localeEnv = String.fromEnvironment('LOCALE', defaultValue: 'en');
  final localeEnv = detectLocale();
  print("env local langue IS >>> $localeEnv");
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en', 'fr'],
    basePath: Config.i18nBasePath,  // <- ici, on passe Config.i18nBasePath
  );
  usePathUrlStrategy();  // permet à Google de voir chaque route comme une page distincte
  runApp(LocalizedApp(delegate, MyApp(locale: localeEnv)));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({Key? key, required this.locale}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return SeoController(
      enabled: true,                                 // désactivez si user loggé, testé, etc.
      tree: WidgetTree(context: context),            // parcours du widget tree
      child:SeoHead(
        tags: [
          // 1. Métadatas HTML de base
          MetaTag(name: 'charset',  content: 'UTF-8'),
          MetaTag(name: 'viewport', content: 'width=device-width, initial-scale=1'),
          MetaTag(name: 'robots',   content: 'index, follow'),

          // 2. Titre et description
          MetaTag(name: 'title',       content: appTitleForCtrSERP),
          MetaTag(name: 'description', content: metaDescription),

          // 3. Canonical & hreflang
          LinkTag(rel: 'canonical', href: mainPageLinkTagCanonical),
          LinkTag(rel: 'alternate', hreflang: 'en', href: mainPageLinkTagAlternateFR),
          LinkTag(rel: 'alternate', hreflang: 'fr', href: mainPageLinkTagAlternateEN),
          LinkTag(rel: 'alternate', hreflang: 'x-default', href: mainPageLinkTagAlternateDefault),
          /**
          // 4. Open Graph NOT WORKING NEED SERVERLESS
          MetaTag(name: 'og:type',        content: 'website'),
          MetaTag(name: 'og:title',       content: appTitleForCtrSERP),
          MetaTag(name: 'og:description', content: metaDescription),
          MetaTag(name: 'og:url',         content: ogUrl),
          MetaTag(name: 'og:image',       content: ogImg),

          // 5. Twitter Cards NOT WORKING NEED SERVERLESS
          MetaTag(name: 'twitter:card',        content: 'summary_large_image'),
          MetaTag(name: 'twitter:title',       content: titre),
          MetaTag(name: 'twitter:description', content: description),
          MetaTag(name: 'twitter:image',       content: imageUrl),
          **/
        ],
        child: Seo.html(/// JSON-LD Organization
          html: '''
            <title>$appTitleForCtrSERP</title>
            <script type="application/ld+json">
            {
              "@context":"https://schema.org",
              "@type":"Organization",
              "url":"$mainPageLinkTagAlternateDefault",
              "name":"$appTitleForCtrSERP",
              "sameAs":[
                "$youtubeLink",
                "$instagram",
                "$tiktok"
              ]
            }
            </script>
            ''',
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
        ),



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

  void showDemoActionSheet(
      {required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => child).then((String? value) {
      if (value != null) changeLocale(context, value);
    });
  }

  void _onActionSheetPress(BuildContext context) {
    showDemoActionSheet(
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
              child: Text(translate('button.cancel'),style: TextStyle(color: Colors.red),),
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context, null),
            ),
          ),
        )
    );
  }
}
