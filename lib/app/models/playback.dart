import 'package:video_player/video_player.dart';

class Playback {
  final String? url;

  VideoPlayerController? _videoController;
  VideoPlayerController? get videoController => _videoController;

  Playback({this.url})
      : assert(
          url != null,
        );

  Future<void>? _initializeVideoPlayerFuture;
  Future<void>? get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;

  Future<Null> loadController() async {
    _videoController = VideoPlayerController.network(url!,
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,
        ));
    _initializeVideoPlayerFuture = _videoController?.initialize();
    _videoController?.setLooping(true);
  }
}
