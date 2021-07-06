import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/appEntry.dart';
import 'package:social_app/ui/views/main/main_view_model.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocator.setupLocator();

  MainViewModel _mainViewModel = MainViewModel();
  _mainViewModel.appInitialLoad();

  runApp(AppEntry(mainViewModel: _mainViewModel));
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Infinite List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(leading: Text("$index"), title: Text("Number $index"));
        },
      ),
    );
  }
}
