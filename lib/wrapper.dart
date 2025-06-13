import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_test_generated/src/config.dart';
import 'package:template_test_generated/src/functions.dart';
import 'package:template_test_generated/widgets/customed_icons.dart';

class Wrapper extends StatefulWidget {
  final Widget child;
  final BuildContext maincontext;

  const Wrapper({
    super.key,
    required this.child,
    required this.maincontext,
  });

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printf("[Wrapper] init...");
    printf("[Wrapper] config label = ${Config.bannerLabel} config color ${Config.bannerColor} ");
    printf("[Wrapper] init finished!");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(translate('seo_test.appTitleForCtrSERP')),
        actions: [
          IconButton(
            icon: const CustomedIcon(icon: FontAwesomeIcons.language, size: 30,),
            onPressed: () => _onActionSheetPress(context),
            tooltip: translate('button.change_language'),
          ),
          Config.bannerLabel != "PROD"
          ?Banner(
            message: Config.bannerLabel,
            location: BannerLocation.topStart,
            color: Config.bannerColor,
            child: Text("             ")
          ):SizedBox.shrink(),
        ],
      ),
      body: widget.child,
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
              child: Text(translate('language_button.cancel'),style: TextStyle(color: Colors.red),),
            ),
          ),
        )
    );
  }
}