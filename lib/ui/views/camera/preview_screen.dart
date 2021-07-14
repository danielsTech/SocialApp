import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/ui/widgets/delayed/loading_widget.dart';

class PreviewScreen extends StatelessWidget {
  String? path;

  PreviewScreen({
    Key? key,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: path != null
            ? Image.file(
                File(path!),
                fit: BoxFit.cover,
                width: ScreenUtil.screenWidthLp,
                height: ScreenUtil.screenHeightLp,
              )
            : LoadingWidget(),
      ),
    );
  }

  // Positioned get _backBtn => Positioned(
  //       left: 15.0,
  //       top: 15.0,
  //       child: GestureDetector(),
  //     );

  // Widget get _preview => Positioned.fill(
  //       child: Image.file(
  //         File(path),
  //         fit: BoxFit.cover,
  //       ),
  //     );
}
