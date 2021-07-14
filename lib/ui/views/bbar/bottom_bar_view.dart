import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/ui/views/bbar/floating_action_button.dart';
import 'package:social_app/ui/views/bbar/items/account_button.dart';
import 'package:social_app/ui/views/bbar/items/data_button.dart';
import 'package:social_app/ui/views/bbar/items/ig_feed_button.dart';
import 'package:social_app/ui/views/bbar/items/tt_feed_button.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        _Bar(),
        FABView(),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (context, screenData, _) => Container(
        width: ScreenUtil.screenWidthLp,
        height: AppConstants.bottomBarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, screenData.screenSelectedIndex != 1 ? 50.0 : 0.0),
              blurRadius: 50.0,
              spreadRadius: 35.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: TTFeedButton()),
            Expanded(child: IGFeedButton()),
            WidgetsUtil.horizontalSpace(ScreenUtil.screenWidthLp / 4.0),
            Expanded(child: DataButton()),
            Expanded(child: AccountButton()),
          ],
        ),
      ),
    );
  }
}
