import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/router/router.dart';

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({Key? key}) : super(key: key);

  @override
  _ScreenWrapperState createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(
      builder: (context, screenData, _) {
        return IndexedStack(
          children: AppRouter.pageWidgets.map((screen) => screen).toList(),
          index: screenData.screenSelectedIndex,
        );
        // return Stack(
        //   children: List.generate(
        //     AppRouter.pageKeysString.length,
        //     (index) => _buildOffstageNavigator(
        //       AppRouter.pageKeysString[index],
        //       screenData.currentPageString,
        //     ),
        //   ),
        // );
      },
    );
  }
}

//   Widget _buildOffstageNavigator(String tabItem, String currentItem) {
//     return Offstage(
//       offstage: currentItem != tabItem,
//       child: _TabNavigator(
//         navigatorKey: AppRouter.navigatorKeys[tabItem],
//         tabItem: tabItem,
//       ),
//     );
//   }
// }

// class _TabNavigator extends StatelessWidget {
//   final GlobalKey<NavigatorState>? navigatorKey;
//   final String? tabItem;

//   _TabNavigator({
//     this.navigatorKey,
//     this.tabItem,
//   }) : assert(navigatorKey != null);

//   @override
//   Widget build(BuildContext context) {
//     late Widget child;

//     for (int pageKeyIndex = 0; pageKeyIndex < AppRouter.pageKeysString.length; pageKeyIndex++) {
//       if (tabItem == AppRouter.pageKeysString[pageKeyIndex]) child = AppRouter.pageWidgets[pageKeyIndex];
//     }

//     return Navigator(
//       key: navigatorKey!,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(builder: (context) => child);
//       },
//     );
//   }
// }
