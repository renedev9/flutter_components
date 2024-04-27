import 'package:flutter/cupertino.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/inputs_page.dart';
import 'package:flutter_components/src/pages/listView_page.dart';
import 'package:flutter_components/src/pages/sliders_page.dart';

Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{
    //'/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
    'inputs': (BuildContext context) => Inputs_Page(),
    'slider': (BuildContext context) => SlidersPage(),
    'list': (BuildContext context) => ListPage(),
  };
}
