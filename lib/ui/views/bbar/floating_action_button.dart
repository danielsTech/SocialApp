import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/anim/durations.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/models/playback.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_app/ui/views/camera/camera_view.dart';
import 'package:animations/animations.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/app/extensions/video_extensions.dart';

class FABView extends StatelessWidget {
  const FABView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 10.0,
      child: Consumer<ScreenProvider>(
        builder: (context, screenData, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OpenContainer(
              openElevation: 0.0,
              closedElevation: 0.0,
              openColor: Colors.black,
              closedColor: Colors.black,
              middleColor: Colors.black,
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: AnimationDurations.cameraScreenOpenAnimationDuration,
              openBuilder: (context, _) => CameraView(),
              closedShape: CircleBorder(),
              closedBuilder: (context, openContainer) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  _pauseVideo();
                  screenData.plusButtonHideController.forward();
                  Future.delayed(const Duration(milliseconds: 55), () => openContainer());
                },
                onTapDown: (_) => screenData.plusButtonBounceController.forward(),
                onTapUp: (_) => screenData.plusButtonBounceController.reverse(),
                onTapCancel: () => screenData.plusButtonBounceController.reverse(),
                child: Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35.0),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFec008c),
                        Color(0xFFfc6767),
                      ],
                    ),
                    border: Border.all(color: Colors.white.withOpacity(0.6), width: 0.8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink[500]!.withOpacity(0.65),
                        offset: Offset(0.0, 0.5),
                        blurRadius: 5.0,
                        spreadRadius: 1.5,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                    color: Colors.white,
                  )
                      .scale(AnimationTweens.plusButtonBounceAnimation!.value)
                      .opacity(1.0 - AnimationControllers.plusButtonHideAnimationController!.value)
                      .scale(1.0 - (0.8 * AnimationControllers.plusButtonHideAnimationController!.value)),
                ),
              ).opacity(1.0 - AnimationControllers.plusButtonHideAnimationController!.value),
            ),
          ],
        ),
      ),
    );
  }

  void _pauseVideo() {
    if (AnimationControllers.playAndPauseAnimationController!.isDismissed) {
      AppLocator.locator<FeedViewModel>().getCurrentHalfSwipePost.playback!.videoController!.pause();
    }
  }
}
