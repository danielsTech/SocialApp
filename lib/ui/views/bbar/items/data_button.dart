import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';

class DataButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (context, screenData, _) => GestureDetector(
        onTap: () {
          Provider.of<ScreenProvider>(context, listen: false).selectBottomNavigationBarTab(2);
        },
        onTapDown: (_) => screenData.blocButtonBounceController.forward(),
        onTapUp: (_) => screenData.blocButtonBounceController.reverse(),
        onTapCancel: () => screenData.blocButtonBounceController.reverse(),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: AppConstants.bottomBarHeight,
          // color: Colors.purple,
          child: Icon(
            Icons.data_saver_off_rounded,
            size: 26.5,
            color: screenData.screenSelectedIndex == 2 ? Colors.white : Colors.white70,
          ).scale(AnimationTweens.blocButtonBounceAnimation!.value),
        ),
      ),
    );
  }
}
