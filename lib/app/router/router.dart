import 'package:flutter/material.dart';
import 'package:social_app/app/router/routes.dart';
import 'package:social_app/ui/views/account/account_view.dart';
import 'package:social_app/ui/views/block/bc_view.dart';
import 'package:social_app/ui/views/feed/ig/ig_feed_view.dart';
import 'package:social_app/ui/views/feed/tt/tt_feed_view.dart';
import 'package:social_app/ui/views/main/main_view.dart';
import 'package:social_app/ui/views/unknown/unknown_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.mainRoute:
        return MaterialPageRoute(builder: (context) => MainView());

      default:
        return MaterialPageRoute(builder: (context) => UnknownView());
    }
  }

  static final List<String> _pageKeysString = [
    "TT",
    "IG",
    "BC",
    "AC",
  ];
  static List<String> get pageKeysString => _pageKeysString;

  static final List<Widget> _pageWidgets = [
    TTFeedView(),
    IGFeedView(),
    BCView(),
    AccountView(),
  ];
  static List<Widget> get pageWidgets => _pageWidgets;

  static final Map<String, Widget> navigationKeyScreens = {
    _pageKeysString[0]: _pageWidgets[0],
    _pageKeysString[1]: _pageWidgets[1],
    _pageKeysString[2]: _pageWidgets[2],
    _pageKeysString[3]: _pageWidgets[3],
  };

  static final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    pageKeysString[0]: GlobalKey<NavigatorState>(),
    pageKeysString[1]: GlobalKey<NavigatorState>(),
    pageKeysString[2]: GlobalKey<NavigatorState>(),
    pageKeysString[3]: GlobalKey<NavigatorState>(),
  };
}
