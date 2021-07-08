import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  final double? thickness;

  const LoadingWidget({
    Key? key,
    this.size,
    this.color,
    this.thickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _size = size ?? 28.0;

    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      child: Platform.isIOS ? _cupertinoIndicator : _materialIndicator,
    );
  }

  Widget get _cupertinoIndicator => const CupertinoActivityIndicator();

  Widget get _materialIndicator => CircularProgressIndicator(
      strokeWidth: thickness ?? 2.4, valueColor: color != null ? AlwaysStoppedAnimation<Color>(color!) : null);
}
