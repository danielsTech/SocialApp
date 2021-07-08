import 'package:flutter/material.dart';

class ShareIconWidget extends StatelessWidget {
  final Color? iconColor;
  final double? iconSize;

  const ShareIconWidget({
    Key? key,
    this.iconSize,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.send_rounded,
      size: iconSize ?? 37.0,
      color: iconColor ?? Colors.white,
    );
  }
}
