import 'package:flutter/animation.dart';
import 'package:social_app/app/anim/controllers.dart';

class AnimationService {
  // PLAY - PAUSE
  static final AnimationController _playAndPauseAnimationController =
      AnimationControllers.playAndPauseAnimationController!;
  AnimationController get playAndPauseAnimationController => _playAndPauseAnimationController;

  static final AnimationController _playAndPauseIconAnimationController =
      AnimationControllers.playAndPauseIconAnimationController!;
  AnimationController get playAndPauseIconAnimationController => _playAndPauseIconAnimationController;

  static final Animation<double> _playAndPauseAnimation = AnimationTweens.playAndPauseAnimation!;
  Animation<double> get playAndPauseAnimation => _playAndPauseAnimation;

  void handlePlayAndPauseAnimation(final bool isReverse) {
    if (isReverse) {
      _playAndPauseAnimationController.reverse();
      _playAndPauseIconAnimationController.reverse();

      // _postProfileAvatarRippleAnimationController.forward();
    } else {
      _playAndPauseAnimationController.forward();
      _playAndPauseIconAnimationController.forward();

      // _postProfileAvatarRippleAnimationController.reset();
      // _postProfileAvatarRippleAnimationController.stop();
    }
  }

  void get resetPlayAndPauseAnimation {
    if (_playAndPauseAnimationController.isCompleted) {
      _playAndPauseAnimationController.reverse();
      _playAndPauseIconAnimationController.reverse();
    }
  }

  // MAIN SCREEN SWITCH
  static final AnimationController _screenSwitchPartOneAnimationController =
      AnimationControllers.screenSwitchPartOneAnimationController!;
  AnimationController get screenSwitchPartOneAnimationController => _screenSwitchPartOneAnimationController;

  static final AnimationController _screenSwitchPartTwoAnimationController =
      AnimationControllers.screenSwitchPartTwoAnimationController!;
  AnimationController get screenSwitchPartTwoAnimationController => _screenSwitchPartTwoAnimationController;

  static final Animation<double> _screenSwitchPartOneAnimation = AnimationTweens.screenSwitchPartOneAnimation!;
  Animation<double> get screenSwitchPartOneAnimation => _screenSwitchPartOneAnimation;

  static final Animation<double> _screenSwitchPartTwoAnimation = AnimationTweens.screenSwitchPartTwoAnimation!;
  Animation<double> get screenSwitchPartTwoAnimation => _screenSwitchPartTwoAnimation;
}
