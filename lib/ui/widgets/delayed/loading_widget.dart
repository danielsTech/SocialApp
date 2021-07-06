import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final double thickness;
  final Color color;

  const LoadingWidget({
    this.size = 50.0,
    this.thickness = 2.0,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: this.size,
          height: this.size,
          child: Platform.isIOS
              ? CupertinoActivityIndicator()
              : CircularProgressIndicator(
                  strokeWidth: thickness,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
        ),
      );
}
