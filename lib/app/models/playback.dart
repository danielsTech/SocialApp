import 'package:video_player/video_player.dart';

class Playback {
  final String? url;

  VideoPlayerController? videoController;

  Playback({this.url}) : assert(url != null);

  Future<void>? _initializeVideoPlayerFuture;
  Future<void>? get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;

  bool videoVisibility = false; // video visibility - hide/show for performance improvment

  Future<Null> loadController() async {
    videoController = VideoPlayerController.network(
      url!,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _initializeVideoPlayerFuture = videoController?.initialize();
    videoController?.setLooping(true);
  }
}
