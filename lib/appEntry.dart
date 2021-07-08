import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/data/strings.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/provider/screen.dart';
import 'package:social_app/app/router/router.dart';
import 'package:social_app/app/router/routes.dart';
import 'package:social_app/app/theme/themer.dart';
import 'package:social_app/app/theme/themes.dart';
import 'package:social_app/ui/views/main/main_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class AppEntry extends StatefulWidget {
  MainViewModel? mainViewModel;

  AppEntry({
    Key? key,
    this.mainViewModel,
  }) : super(key: key);

  @override
  _AppEntryState createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> with TickerProviderStateMixin {
  static late GlobalKey<NavigatorState> _navigatorKey;
  static late String _initialRoute;

  @override
  void initState() {
    super.initState();
    _initialRoute = AppRoutes.mainRoute;
    _navigatorKey = AppLocator.locator.get<NavigationService>().navigatorKey!;
    AnimationsInitializer(this).initializeAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ScreenProvider()),
      ],
      builder: (context, _) {
        // final _themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: _initialRoute,
          navigatorKey: _navigatorKey,
          // themeMode: _themeProvider.themeMode,
          darkTheme: AppThemes.darkTheme,
          // theme: AppThemes.lightTheme,
        );
      },
    );
  }
}
