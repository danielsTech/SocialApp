import 'package:flutter/material.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/router/router.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';

class ScreenProvider extends ChangeNotifier {
  String _currentPageString = AppRouter.pageKeysString[0];
  String get currentPageString => _currentPageString;

  set setCurrentPageString(String page) {
    _currentPageString = page;
    notifyListeners();
  }

  void selectBottomNavigationBarTab(String tabItem, int index) {
    final _bottomBarViewModel = AppLocator.locator.get<BottomBarViewModel>();

    _bottomBarViewModel.setSelectedTabIndex = index;

    if (tabItem == currentPageString) {
      AppRouter.navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setCurrentPageString = AppRouter.pageKeysString[index];
    }
  }
}
