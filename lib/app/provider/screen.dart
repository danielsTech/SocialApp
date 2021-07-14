import 'package:flutter/material.dart';
import 'package:social_app/app/anim/controllers.dart';

class ScreenProvider extends ChangeNotifier {
  int _screenSelectedIndex = 0;
  int get screenSelectedIndex => _screenSelectedIndex;

  set setScreenSelectedIndex(int index) {
    _screenSelectedIndex = index;
    notifyListeners();
  }

  void selectBottomNavigationBarTab(int index) => setScreenSelectedIndex = index;

  // BOUNCES
  AnimationController ttFeedButtonBounceController = AnimationControllers.ttFeedButtonBounceAnimationController!;
  AnimationController igFeedButtonBounceController = AnimationControllers.igFeedButtonBounceAnimationController!;
  AnimationController blocButtonBounceController = AnimationControllers.blocButtonBounceAnimationController!;
  AnimationController accountButtonBounceController = AnimationControllers.accountButtonBounceAnimationController!;
  AnimationController plusButtonBounceController = AnimationControllers.plusButtonBounceAnimationController!;
  AnimationController plusButtonHideController = AnimationControllers.plusButtonHideAnimationController!;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    ttFeedButtonBounceController.addListener(() => notifyListeners());
    igFeedButtonBounceController.addListener(() => notifyListeners());
    blocButtonBounceController.addListener(() => notifyListeners());
    accountButtonBounceController.addListener(() => notifyListeners());
    plusButtonBounceController.addListener(() => notifyListeners());
    plusButtonHideController.addListener(() => notifyListeners());
  }
}
