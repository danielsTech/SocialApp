import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget rotate(double angle) => Transform.rotate(
        angle: angle,
        child: this,
      );

  Widget scale(double scale, {AlignmentGeometry alignmentGeometry = Alignment.center}) => Transform.scale(
        alignment: alignmentGeometry,
        scale: scale,
        child: this,
      );

  Widget opacity(double opacity) => Opacity(
        opacity: opacity,
        child: this,
      );

  Widget translatePx(double x, double y) => Transform.translate(
        offset: Offset(x, y),
        child: this,
      );

  Widget solidBadge({
    double radius = 4.5,
    Color color = Colors.red,
  }) =>
      Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: [
          this,
          Positioned(
            top: 12.5,
            right: 12.5,
            child: CircleAvatar(backgroundColor: color, radius: radius),
          )
        ],
      );

  Widget counterBadge({
    @required int? counter,
    double fontSize = 15.0,
    double radius = 10.0,
  }) {
    final _countText = counter.toString();
    final _deltaFontSize = (_countText.length - 1) * 2.5;

    return Stack(overflow: Overflow.visible, children: [
      this,
      Positioned(
        top: -5.0,
        right: -18.0,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          child: Text(
            _countText,
            style: TextStyle(
              fontSize: fontSize - _deltaFontSize,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      )
    ]);
  }
}
