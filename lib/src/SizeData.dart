import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

iconsSize(BuildContext context){
  return ResponsiveValue(
    context,
    defaultValue: 10.0,
    conditionalValues: [
      Condition.equals(name: MOBILE, value: 25.0),
      Condition.equals(name: TABLET, value: 30.0),
      Condition.equals(name: DESKTOP, value: 35.0),
      Condition.equals(name: "4K", value: 40.0),
    ],
  ).value;
}