import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/appEntry.dart';
import 'package:social_app/ui/views/main/main_view_model.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocator.setupLocator();

  MainViewModel().appInitialLoad();

  runApp(AppEntry());
}
