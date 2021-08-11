import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:social_app/app/anim/durations.dart';

class AnimationControllers {
  // PLAY - PAUSE ICON
  static AnimationController? playAndPauseAnimationController;
  static AnimationController? playAndPauseIconAnimationController;

  // BUTTONS BOUNCE
  static AnimationController? ttFeedButtonBounceAnimationController;
  static AnimationController? igFeedButtonBounceAnimationController;
  static AnimationController? blocButtonBounceAnimationController;
  static AnimationController? accountButtonBounceAnimationController;
  static AnimationController? plusButtonBounceAnimationController;

  // OTHER
  static AnimationController? plusButtonHideAnimationController;
}

class AnimationTweens {
  // PLAY - PAUSE ICON
  static Animation<double>? playAndPauseAnimation;

  // BUTTONS BOUNCE
  static Animation<double>? ttFeedButtonBounceAnimation;
  static Animation<double>? igFeedButtonBounceAnimation;
  static Animation<double>? blocButtonBounceAnimation;
  static Animation<double>? accountButtonBounceAnimation;
  static Animation<double>? plusButtonBounceAnimation;
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
    // ****************************************************** CONTROLLERS

    // PLAY - PAUSE ICON
    AnimationControllers.playAndPauseAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.videoPlayAndPauseAnimationDuration,
    );
    AnimationControllers.playAndPauseIconAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.videoPlayAndPauseIconAnimationDuration,
    );

    // BUTTONS BOUNCE
    AnimationControllers.ttFeedButtonBounceAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.buttonsBounceAnimationDuration,
    );
    AnimationControllers.igFeedButtonBounceAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.buttonsBounceAnimationDuration,
    );
    AnimationControllers.blocButtonBounceAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.buttonsBounceAnimationDuration,
    );
    AnimationControllers.accountButtonBounceAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.buttonsBounceAnimationDuration,
    );
    AnimationControllers.plusButtonBounceAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: AnimationDurations.buttonsBounceAnimationDuration,
    );
    AnimationControllers.plusButtonHideAnimationController = AnimationController(
      vsync: _tickerProvider,
      duration: Duration(milliseconds: AnimationDurations.cameraScreenOpenAnimationDuration.inMilliseconds - 200),
    );

    //
    //
    //
    // ****************************************************** TWEENS

    // PLAY - PAUSE ICON
    AnimationTweens.playAndPauseAnimation =
        setAnimation(AnimationControllers.playAndPauseAnimationController!, Curves.fastOutSlowIn)
            .drive(setValTween(0.0, 1.0));

    // BUTTONS BOUNCE
    AnimationTweens.ttFeedButtonBounceAnimation =
        setAnimation(AnimationControllers.ttFeedButtonBounceAnimationController!, Curves.easeOutSine)
            .drive(setValTween(1.0, 0.9));
    AnimationTweens.igFeedButtonBounceAnimation =
        setAnimation(AnimationControllers.igFeedButtonBounceAnimationController!, Curves.easeOutSine)
            .drive(setValTween(1.0, 0.9));
    AnimationTweens.blocButtonBounceAnimation =
        setAnimation(AnimationControllers.blocButtonBounceAnimationController!, Curves.easeOutSine)
            .drive(setValTween(1.0, 0.9));
    AnimationTweens.accountButtonBounceAnimation =
        setAnimation(AnimationControllers.accountButtonBounceAnimationController!, Curves.easeOutSine)
            .drive(setValTween(1.0, 0.9));
    AnimationTweens.plusButtonBounceAnimation =
        setAnimation(AnimationControllers.plusButtonBounceAnimationController!, Curves.easeOutSine)
            .drive(setValTween(1.0, 0.85));
  }
}
