import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomBarViewModel extends BaseViewModel {
  final Color unselectedTabColor = Colors.white.withOpacity(0.8);

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  set setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}
