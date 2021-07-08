import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetsUtil {
  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);

  static BoxDecoration foregroundFade(
    final Color color1,
    final Color color2, {
    final AlignmentGeometry? alignmentStart = Alignment.bottomCenter,
    final AlignmentGeometry? alignmentEnd = Alignment.center,
    final List<double>? stops,
  }) =>
      BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: alignmentStart!,
          end: alignmentEnd!,
          stops: stops ?? [0.0, 0.3],
        ),
      );

  static BoxShadow shadow({
    final double? blur,
    final double? spread,
    final Color? color,
    final Offset? offset,
  }) =>
      BoxShadow(
        blurRadius: blur ?? 8.0,
        spreadRadius: spread ?? 0.2,
        color: color ?? Colors.black,
        offset: offset ?? Offset.zero,
      );
}
