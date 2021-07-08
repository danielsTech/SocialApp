import 'package:flutter/material.dart';

class LikeIconWidget extends StatelessWidget {
  final Color? iconColor;
  final double? iconSize;

  const LikeIconWidget({
    Key? key,
    this.iconSize,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_rounded,
      size: iconSize ?? 40.0,
      color: iconColor ?? Colors.white,
    );
  }
}
