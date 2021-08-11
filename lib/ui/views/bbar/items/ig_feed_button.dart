import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';

class IGFeedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (context, screenData, _) => GestureDetector(
        onTap: () {
          Provider.of<ScreenProvider>(context, listen: false).selectBottomNavigationBarTab(1);
        },
        onTapDown: (_) => screenData.igFeedButtonBounceController.forward(),
        onTapUp: (_) => screenData.igFeedButtonBounceController.reverse(),
        onTapCancel: () => screenData.igFeedButtonBounceController.reverse(),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: AppConstants.bottomBarHeight,
          child: Icon(
            Icons.filter,
            size: 24.0,
            color: screenData.screenSelectedIndex == 1 ? Colors.white : Colors.white70,
          ).scale(AnimationTweens.igFeedButtonBounceAnimation!.value),
        ),
      ),
    );
  }
}
