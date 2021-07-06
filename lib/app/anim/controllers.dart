import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:social_app/app/anim/durations.dart';

class AnimationControllers {
  // PLAY - PAUSE ICON
  static AnimationController? playAndPauseAnimationController;
  static AnimationController? playAndPauseIconAnimationController;

  // MAIN SCREEN SWITCH
  static AnimationController? screenSwitchPartOneAnimationController;
  static AnimationController? screenSwitchPartTwoAnimationController;
}

class AnimationTweens {
  // PLAY - PAUSE ICON
  static Animation<double>? playAndPauseAnimation;

  // MAIN SCREEN SWITCH
  static Animation<double>? screenSwitchPartOneAnimation;
  static Animation<double>? screenSwitchPartTwoAnimation;
}

class AnimationsInitializer {
  late TickerProvider _tickerProvider;

  AnimationsInitializer(TickerProvider? tickerProvider) {
    _tickerProvider = tickerProvider!;
  }

  static Tween<double> setValTween(begin, end) => Tween<double>(begin: begin, end: end);

  static CurvedAnimation setAnimation(Animation<double> controller, Curve curve) =>
      CurvedAnimation(parent: controller, curve: curve);

  void initializeAnimations() {
    // CONTROLLERS

    // PLAY - PAUSE ICON
    AnimationControllers.playAndPauseAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.videoPlayAndPauseAnimationDuration,
    );
    AnimationControllers.playAndPauseIconAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.videoPlayAndPauseIconAnimationDuration,
    );

    // MAIN SCREEN SWITCH
    AnimationControllers.screenSwitchPartOneAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.halfScreenSwitchAnimationDuration,
    );
    AnimationControllers.screenSwitchPartTwoAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.halfScreenSwitchAnimationDuration,
    );

    // TWEENS

    // PLAY - PAUSE ICON
    AnimationTweens.playAndPauseAnimation =
        setAnimation(AnimationControllers.playAndPauseAnimationController!, Curves.fastOutSlowIn)
            .drive(setValTween(0.0, 1.0));

    // MAIN SCREEN SWITCH
    AnimationTweens.screenSwitchPartOneAnimation =
        setAnimation(AnimationControllers.screenSwitchPartOneAnimationController!, Curves.easeInToLinear)
            .drive(setValTween(0.0, 1.0));
    AnimationTweens.screenSwitchPartTwoAnimation =
        setAnimation(AnimationControllers.screenSwitchPartTwoAnimationController!, Curves.linearToEaseOut)
            .drive(setValTween(0.0, 1.0));
  }
}
