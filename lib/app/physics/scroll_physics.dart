import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

abstract class CustomScrollPhysics {
  static final _CustomTTFeedCarouselScrollPhysics mainTTFeedCarouselScrollPhysics =
      _CustomTTFeedCarouselScrollPhysics();
}

class _CustomTTFeedCarouselScrollPhysics extends ScrollPhysics {
  const _CustomTTFeedCarouselScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  _CustomTTFeedCarouselScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomTTFeedCarouselScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(mass: 52.5, stiffness: 25.5, damping: 1.15);
  // const SpringDescription(mass: 65, stiffness: 25.7, damping: 1.1);
}
