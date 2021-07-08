import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/router/router.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';
import 'package:stacked/stacked.dart';

class TTFeedButton extends ViewModelWidget<BottomBarViewModel> {
  const TTFeedButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, BottomBarViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        Provider.of<ScreenProvider>(context, listen: false)
            .selectBottomNavigationBarTab(AppRouter.pageKeysString[0], 0);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: AppConstants.bottomBarHeight,
        child: Icon(
          Icons.subject_rounded,
          size: 30.0,
          color: viewModel.selectedTabIndex == 0 ? Colors.white : viewModel.unselectedTabColor,
        ),
      ),
    );
  }
}
