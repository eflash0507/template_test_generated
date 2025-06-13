import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:seo/seo.dart';
import 'package:template_test_generated/pages/home.dart';
import 'package:template_test_generated/src/config.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:template_test_generated/src/functions.dart';
import 'package:template_test_generated/src/seo_datas.dart';
import 'package:template_test_generated/widgets/seo_helpers.dart';
import 'package:template_test_generated/wrapper.dart';

void main() async {
  printf("[MAIN]Bindings Initialization ...");
  WidgetsFlutterBinding.ensureInitialized();
  // recuperate la language passe via --dart-define=LOCALE
  /// const String localeEnv = String.fromEnvironment('LOCALE', defaultValue: 'en');
  final localeEnv = detectLocale();
  printf("[MAIN]Env local language IS >>> $localeEnv");
  printf("[MAIN]Loading languages ...");
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: localeEnv,
    supportedLocales: ['en', 'fr'],
    basePath: Config.i18nBasePath,  // <- ici, on passe Config.i18nBasePath
  );
  printf("[MAIN]Languages loaded!");
  printf("[MAIN]Enabling Path URL Strategy ...");
  usePathUrlStrategy();  // permit à Google de voir chaque route comme une page distincte
  printf("[MAIN]Path URL Strategy Enabled!");
  printf("[MAIN]Bindings Initialization Finished!");
  printf("[MAIN]Starting app ...");
  runApp(LocalizedApp(delegate, MyApp(locale: localeEnv)));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
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
              onGenerateRoute: (RouteSettings settings) {
                late Widget page;
                switch (settings.name) {
                  case '/':
                  case '/en':
                  case '/fr':
                    page = MyHomePage();
                    break;
                    /**
                  case '/about':
                    page = AboutPage();
                    break;
                  case '/devices':
                    page = DevicesPage();
                    break;
                    **/

                  default:
                    page = Scaffold(
                      body: Center(child: Text(translate('unknown_page.title'))),
                    );
                }
                printf("[MyApp]RouteInfo: settings = ${settings.name} locale = $locale");

                // On enveloppe systématiquement dans `Wrapper`
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => Wrapper(
                    maincontext: context,
                    child: page,
                  ),
                );
              },
              title: translate('seo_test.appTitleForCtrSERP')
          ),
        )
      ),
    );
  }
}


