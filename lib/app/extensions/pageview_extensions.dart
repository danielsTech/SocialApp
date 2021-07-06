import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

extension PageViewExtensions on PageController {
  // check for tt feed swipe
  bool get ttFeedDown => this.position.userScrollDirection == ScrollDirection.reverse;
}
