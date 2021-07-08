import 'package:flutter/material.dart';
import 'package:social_app/app/data/styles.dart';
import 'package:social_app/ui/widgets/icons/comment_icon_widget.dart';

class CommentsButtonWidget extends StatelessWidget {
  final int? count;
  final void Function()? onPress;

  final double? iconSize;
  final Color? iconColor;

  final TextStyle? textStyle;

  const CommentsButtonWidget({
    Key? key,
    this.iconSize,
    this.iconColor,
    this.textStyle,
    required this.count,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentIconWidget(
          iconSize: iconSize,
          iconColor: iconColor,
        ),
        Text(
          count.toString(),
          style: textStyle ??
              AppTextStyles.appSmallInfo.copyWith(color: Colors.white, fontWeight: AppTextStyles.moderateWeight),
        )
      ],
    );
  }
}
