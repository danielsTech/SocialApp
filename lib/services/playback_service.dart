import 'package:flutter/rendering.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/models/playback.dart';
import 'package:social_app/app/utils/functions.dart';
import 'package:social_app/mock_data.dart';
import 'package:social_app/services/posts_service.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/app/extensions/pageview_extensions.dart';
import 'package:social_app/app/extensions/list_extensions.dart';
import 'package:social_app/app/extensions/video_extensions.dart';

class PlaybackSerivce {
  final _postsService = AppLocator.locator<PostsService>();

  Future<void> videoPlaybackLoad(int index) async {
    if (_postsService.videosPostsCount > index) {
      await _postsService.videoPosts[index].playback?.loadController();
      if (index == 0) await _postsService.videoPosts[index].playback?.videoController!.playVideo;
    }
  }

  Future<void> imagePlaybackLoad(int index) async {}

  int _preloadVideoItemIndex = 0;

  Future<void> videoPlaybackPreload(int currentIndex) async {
    if (getSwipeDirection) {
      final int _preloadIndexing = currentIndex + 2;

      if (!_postsService.videoPosts.elementContainsAtIndex(_preloadIndexing) &&
          _preloadIndexing < mockVideoPosts.length) {
        for (int videoCountIndex = 0; videoCountIndex < 3; videoCountIndex++) {
          _preloadVideoItemIndex = currentIndex + 2 + videoCountIndex;
          await _postsService.loadPost(_preloadVideoItemIndex);
          videoPlaybackLoad(_preloadVideoItemIndex);
        }
      }
    }
  }

  bool get getSwipeDirection => AppLocator.locator<FeedViewModel>().ttSwiperController.ttFeedDown;

  void playAndPauseVideoBySwipe(int currentIndex, int previousIndex) async {
    Playback _prevPlayback = _postsService.videoPosts[previousIndex].playback!;
    Playback _currPlayback = _postsService.videoPosts[currentIndex].playback!;
    _prevPlayback.videoController!.pauseVideo;
    _currPlayback.videoController!.playVideo;
  }

  // bool isVideoPlaying(VideoPlayerController _videoController) => _videoController.isVideoPlaying;
}
