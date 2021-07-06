import 'package:flutter/material.dart';
import 'package:social_app/app/models/playback.dart';
import 'package:social_app/ui/widgets/delayed/loading_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:social_app/app/extensions/video_extensions.dart';

class VideoPlaybackWidget extends StatelessWidget {
  final Playback? playback;
  final Decoration? foreground;

  const VideoPlaybackWidget({
    Key? key,
    this.playback,
    this.foreground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.playback!.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final VideoPlayerValue _videoPlayerValue = this.playback!.videoController!.getVideoValue;

          final double _aspectRatio = _videoPlayerValue.aspectRatio;

          final bool _contain = _aspectRatio > 1.3 ? true : false;

          final BoxFit _fit = _contain ? BoxFit.contain : BoxFit.cover;

          return Container(
            foregroundDecoration: this.foreground,
            child: FittedBox(
              fit: _fit,
              child: SizedBox(
                width: _videoPlayerValue.size.width,
                height: _videoPlayerValue.size.height,
                child: VideoPlayer(this.playback!.videoController!),
              ),
            ),
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
