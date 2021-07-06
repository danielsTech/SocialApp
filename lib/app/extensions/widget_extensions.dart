import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget rotate(final double _angle) => Transform.rotate(angle: _angle, child: this);

  Widget scale(final double _scale, {final AlignmentGeometry alignmentGeometry = Alignment.center}) =>
      Transform.scale(alignment: alignmentGeometry, scale: _scale, child: this);

  Widget opacity(final double _opacity) => Opacity(opacity: _opacity, child: this);

  Widget translatePx(final double _x, final double _y) => Transform.translate(offset: Offset(_x, _y), child: this);

  Widget solidBadge({
    final double radius = 4.5,
    final Color color = Colors.red,
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
    @required final int? counter,
    final double fontSize = 15.0,
    final double radius = 10.0,
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
