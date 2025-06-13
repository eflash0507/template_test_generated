import 'package:flutter/material.dart';
import 'package:seo/seo.dart';
import '../widgets/seo_helpers.dart';

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
}