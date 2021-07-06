import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/router/router.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';
import 'package:stacked/stacked.dart';

class DataButton extends ViewModelWidget<BottomBarViewModel> {
  const DataButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, BottomBarViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        Provider.of<ScreenProvider>(context, listen: false)
            .selectBottomNavigationBarTab(AppRouter.pageKeysString[2], 2);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: Constants.bottomBarHeight,
        // color: Colors.purple,
        child: Icon(
          Icons.data_saver_off_rounded,
          size: 26.5,
          color: viewModel.selectedTabIndex == 2 ? Colors.white : viewModel.unselectedTabColor,
        ),
      ),
    );
  }
}
