import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';

class AccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (context, screenData, _) => GestureDetector(
        onTap: () {
          screenData.selectBottomNavigationBarTab(3);
        },
        onTapDown: (_) => screenData.accountButtonBounceController.forward(),
        onTapUp: (_) => screenData.accountButtonBounceController.reverse(),
        onTapCancel: () => screenData.accountButtonBounceController.reverse(),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: AppConstants.bottomBarHeight,
          // color: Colors.yellow,
          child: Icon(
            Icons.account_circle_outlined,
            size: 28.5,
            color: screenData.screenSelectedIndex == 3 ? Colors.white : Colors.white70,
          ).scale(AnimationTweens.accountButtonBounceAnimation!.value),
        ),
      ),
    );
  }
}
