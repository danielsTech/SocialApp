import 'package:flutter/material.dart';
import 'package:social_app/app/data/styles.dart';
import 'package:social_app/ui/widgets/icons/share_icon_widget.dart';

class ShareButtonWidget extends StatelessWidget {
  final int? count;
  final void Function()? onPress;

  final double? iconSize;
  final Color? iconColor;

  final TextStyle? textStyle;

  const ShareButtonWidget({
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
        ShareIconWidget(
          iconSize: iconSize,
          iconColor: iconColor,
        ),
        SizedBox(height: 2.0),
        Text(
          count.toString(),
          style: textStyle ??
              AppTextStyles.appSmallInfo.copyWith(color: Colors.white, fontWeight: AppTextStyles.moderateWeight),
        )
      ],
    );
  }
}
