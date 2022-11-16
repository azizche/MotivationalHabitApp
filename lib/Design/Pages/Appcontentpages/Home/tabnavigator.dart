import 'package:flutter/material.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Community/community.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/homepage.dart';
import 'package:monumental_habits/Design/Pages/Appcontentpages/Home/newhabit.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.pagenumber});
  final GlobalKey<NavigatorState> navigatorKey;
  final int pagenumber;

  @override
  Widget build(BuildContext context) {
    Widget child = Homepage();
    if (pagenumber == 1)
      child = Homepage();
    else if (pagenumber == 2)
      child = CommuntiyPage();
    else if (pagenumber == 3)
      child = Container();
    else if (pagenumber == 4) child = Container();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
