import 'package:flutter/material.dart';
import 'package:social_app/ui/views/account/account_view_model.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.nonReactive(
      viewModelBuilder: () => AccountViewModel(),
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Text('account'),
            ),
          ),
        );
      },
    );
  }
}
