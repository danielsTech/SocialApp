import 'package:flutter/cupertino.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:social_app/ui/views/main/main_view_model.dart';
import 'package:social_app/ui/views/main/screen_wrapper.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  static late Size _size;
  static late EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _padding = MediaQuery.of(context).padding;

    ScreenUtil(_size, _padding).init();

    return ViewModelBuilder<MainViewModel>.nonReactive(
      disposeViewModel: false,
      viewModelBuilder: () => MainViewModel(),
      builder: (context, viewModel, _) => SafeArea(
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: Align(
            alignment: Alignment.bottomCenter,
            child: BottomBarView(),
          ),
          body: ScreenWrapper(),
        ),
      ),
    );
  }
}
