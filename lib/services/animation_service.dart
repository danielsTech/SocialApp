import 'package:social_app/app/anim/controllers.dart';

class AnimationService {
  void handlePlayAndPauseAnimation(final bool isReverse) {
    if (isReverse) {
      AnimationControllers.playAndPauseAnimationController!.reverse();
      AnimationControllers.playAndPauseIconAnimationController!.reverse();
    } else {
      AnimationControllers.playAndPauseAnimationController!.forward();
      AnimationControllers.playAndPauseIconAnimationController!.forward();
    }
  }

  void get resetPlayAndPauseAnimation {
    if (AnimationControllers.playAndPauseAnimationController!.isCompleted) {
      AnimationControllers.playAndPauseAnimationController!.reverse();
      AnimationControllers.playAndPauseIconAnimationController!.reverse();
    }
  }
}
