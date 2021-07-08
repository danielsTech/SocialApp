import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/router/router.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';
import 'package:stacked/stacked.dart';

class AccountButton extends ViewModelWidget<BottomBarViewModel> {
  const AccountButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, BottomBarViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        Provider.of<ScreenProvider>(context, listen: false)
            .selectBottomNavigationBarTab(AppRouter.pageKeysString[3], 3);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: AppConstants.bottomBarHeight,
        // color: Colors.yellow,
        child: Icon(
          Icons.account_circle_outlined,
          size: 28.5,
          color: viewModel.selectedTabIndex == 3 ? Colors.white : viewModel.unselectedTabColor,
        ),
      ),
    );
  }
}
