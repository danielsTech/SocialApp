import 'package:flutter/material.dart';
import 'package:social_app/app/extensions/widget_extensions.dart';

import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:stacked/stacked.dart';

class PlayOrPauseWidget extends ViewModelWidget<FeedViewModel> {
  const PlayOrPauseWidget({Key? key}) : super(key: key, reactive: true);

  static final AnimatedIconData _playPauseIcon = AnimatedIcons.pause_play;

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    double _iconOpacity = viewModel.playAndPauseAnimationController.value;
    double _iconScale = (1.4 - 0.4 * viewModel.playAndPauseAnimation.value);
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: AnimatedIcon(
        icon: _playPauseIcon,
        size: 78.0,
        color: Colors.white,
        progress: viewModel.playAndPauseIconAnimationController,
      ).opacity(_iconOpacity).scale(_iconScale),
    ));
  }
}
