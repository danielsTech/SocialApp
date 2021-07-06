import 'package:flutter/material.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';
import 'package:stacked/stacked.dart';

class FABView extends StatelessWidget {
  const FABView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomBarViewModel>.nonReactive(
      viewModelBuilder: () => BottomBarViewModel(),
      builder: (context, viewModel, _) => Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                print('fab tap');
              },
              child: Container(
                width: 64.0,
                height: 64.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFec008c),
                      Color(0xFFfc6767),
                    ],
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.6), width: 0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink[500]!.withOpacity(0.65),
                      offset: Offset(0.0, 0.5),
                      blurRadius: 5.0,
                      spreadRadius: 1.5,
                    )
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
