import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';

class TTFeedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (context, screenData, _) => GestureDetector(
        onTap: () {
          Provider.of<ScreenProvider>(context, listen: false).selectBottomNavigationBarTab(0);
        },
        onTapDown: (_) => screenData.ttFeedButtonBounceController.forward(),
        onTapUp: (_) => screenData.ttFeedButtonBounceController.reverse(),
        onTapCancel: () => screenData.ttFeedButtonBounceController.reverse(),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: AppConstants.bottomBarHeight,
          child: Icon(
            Icons.subject_rounded,
            size: 30.0,
            color: screenData.screenSelectedIndex == 0 ? Colors.white : Colors.white70,
          ).scale(AnimationTweens.ttFeedButtonBounceAnimation!.value),
        ),
      ),
    );
  }
}
