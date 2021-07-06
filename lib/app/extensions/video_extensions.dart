import 'package:video_player/video_player.dart';

extension VideoExtensions on VideoPlayerController {
  // play video controller
  Future<void> get playVideo async => await this.play();

  // pause video controller
  Future<void> get pauseVideo async => await this.pause();

  // get controller value
  VideoPlayerValue get getVideoValue => this.value;

  // check if video is playing
  bool get isVideoPlaying => this.value.isPlaying;
}
