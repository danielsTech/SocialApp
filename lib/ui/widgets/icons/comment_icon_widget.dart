import 'package:flutter/material.dart';

class CommentIconWidget extends StatelessWidget {
  final Color? iconColor;
  final double? iconSize;

  const CommentIconWidget({
    Key? key,
    this.iconSize,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.comment_outlined,
      size: iconSize ?? 38.0,
      color: iconColor ?? Colors.white,
    );
  }
}
