import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/anim/durations.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:stacked/stacked.dart';

class CameraViewModel extends BaseViewModel {
  final _feedViewModel = AppLocator.locator<FeedViewModel>();

  final PanelController panelController = PanelController();

  bool get panelIsOpen => panelController.isPanelOpen;

  Future<bool> onWillPop(BuildContext context) async {
    onViewBack(context);
    return false;
  }

  void onViewBack(BuildContext context) async {
    if (panelIsOpen) {
      tooglePanel();
    } else {
      Navigator.of(context).pop();

      _cameraLoaded = false;
      _panelAnimationPosition = 0.0;

      if (AnimationControllers.playAndPauseAnimationController!.isDismissed) {
        _feedViewModel.getCurrentHalfSwipePost.playback!.videoController!.play();
      }

      final _provider = Provider.of<ScreenProvider>(context, listen: false);
      await Future<void>.delayed(
          Duration(milliseconds: AnimationDurations.cameraScreenOpenAnimationDuration.inMilliseconds - 30));

      await _provider.plusButtonHideController.reverse().then((_) => _provider.plusButtonHideController.reset());
    }
  }

  bool _cameraLoaded = false;
  bool get cameraLoaded => _cameraLoaded;

  void setCameraLoaded(bool isLoaded, {bool toRebuild = true}) {
    _cameraLoaded = isLoaded;
    if (toRebuild) {
      notifyListeners();
    }
  }

  double _panelAnimationPosition = 0.0;
  double get panelAnimationPosition => _panelAnimationPosition;

  set setPanelAnimationPosition(double position) {
    _panelAnimationPosition = position;
    notifyListeners();
  }

  void tooglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
}
