import 'package:flutter/material.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';
import 'package:social_app/ui/views/bbar/floating_action_button.dart';
import 'package:social_app/ui/views/bbar/items/account_button.dart';
import 'package:social_app/ui/views/bbar/items/data_button.dart';
import 'package:social_app/ui/views/bbar/items/ig_feed_button.dart';
import 'package:social_app/ui/views/bbar/items/tt_feed_button.dart';
import 'package:stacked/stacked.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final _bottomBarViewModel = AppLocator.locator.get<BottomBarViewModel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.nonReactive(
      viewModelBuilder: () => _bottomBarViewModel,
      builder: (context, viewModel, _) => Stack(
        overflow: Overflow.visible,
        children: [
          _Bar(),
          FABView(),
        ],
      ),
    );
  }
}

class _Bar extends ViewModelWidget<BottomBarViewModel> {
  const _Bar({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, BottomBarViewModel viewModel) {
    return Container(
      width: ScreenUtil.screenWidthLp,
      height: Constants.bottomBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, viewModel.selectedTabIndex != 1 ? 40.0 : 0.0),
            blurRadius: 60.0,
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
    );
  }
}
