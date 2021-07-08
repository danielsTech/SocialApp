import 'package:flutter/widgets.dart';

abstract class AppTextStyles {
  // WEIGHTS
  static final FontWeight thinWeight = FontWeight.w300;
  static final FontWeight mediumWeight = FontWeight.w400;
  static final FontWeight moderateWeight = FontWeight.w500;
  static final FontWeight thickWeight = FontWeight.w600;
  static final FontWeight thickestWeight = FontWeight.w800;

  // SPACINGS
  static final double closestSpacing = -0.4;
  static final double closeSpacing = -0.2;
  static final double lowSpacing = 0.05;
  static final double mediumSpacing = 0.2;
  static final double farSpacing = 0.3;
  static final double veryFarSpacing = 0.5;

  // TITLES
  static TextStyle get appSmallTitle => TextStyle(
        fontSize: 14.0,
        fontWeight: moderateWeight,
        letterSpacing: closeSpacing,
      );
  static TextStyle get appMediumTitle => TextStyle(
        fontSize: 19.0,
        fontWeight: thickWeight,
        letterSpacing: lowSpacing,
      );
  static TextStyle get appBigTitle => TextStyle(
        fontSize: 24.0,
        fontWeight: thickestWeight,
        letterSpacing: lowSpacing,
      );

  // INFO
  static TextStyle get appSmallInfo => TextStyle(
        fontSize: 12.0,
        fontWeight: mediumWeight,
        letterSpacing: mediumSpacing,
      );
  static TextStyle get appMediumInfo => TextStyle(
        fontSize: 15.0,
        fontWeight: moderateWeight,
        letterSpacing: farSpacing,
      );
  static TextStyle get appBigInfo => TextStyle(
        fontSize: 18.0,
        fontWeight: moderateWeight,
        letterSpacing: farSpacing,
      );
}
