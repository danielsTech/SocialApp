import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenUtil {
  static late Size _size;
  static late EdgeInsets _padding;

  ScreenUtil(Size? size, EdgeInsets? padding) {
    _size = size!;
    _padding = padding!;
  }

  static late double _pixelRatio;
  static late double _aspectRatio;

  static double get pixelRatio => _pixelRatio;
  static double get aspectRatio => _aspectRatio;

  static late double _screenWidthPx;
  static late double _screenWidthLp;

  static double get screenWidthPx => _screenWidthPx;
  static double get screenWidthLp => _screenWidthLp;

  static late double _screenHeightPx;
  static late double _screenHeightLp;

  static double get screenHeightPx => _screenHeightPx;
  static double get screenHeightLp => _screenHeightLp;

  static late double _statusBarHeightLp;
  static late double _bottomBarHeightLp;

  static double get statusBarHeightLp => _statusBarHeightLp;
  static double get bottomBarHeightLp => _bottomBarHeightLp;

  static final WidgetsBinding _widgetsBinding = WidgetsBinding.instance!;

  void init() {
    _pixelRatio = _widgetsBinding.window.devicePixelRatio;
    _screenWidthPx = _widgetsBinding.window.physicalSize.width;
    _screenHeightPx = _widgetsBinding.window.physicalSize.height;
    _aspectRatio = _widgetsBinding.window.physicalSize.aspectRatio;
    _screenWidthLp = _size.width;
    _screenHeightLp = _size.height;
    _statusBarHeightLp = _padding.top;
    _bottomBarHeightLp = _padding.bottom;
  }
}
