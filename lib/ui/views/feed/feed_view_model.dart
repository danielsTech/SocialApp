import 'package:flutter/cupertino.dart';
import 'package:social_app/app/anim/controllers.dart';
import 'package:social_app/app/data/enums.dart';
import 'package:social_app/app/debug/log.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/models/playback.dart';
import 'package:social_app/app/models/post.dart';
import 'package:social_app/services/animation_service.dart';
import 'package:social_app/services/playback_service.dart';
import 'package:social_app/services/posts_service.dart';
import 'package:stacked/stacked.dart';
import 'package:social_app/app/extensions/video_extensions.dart';

class FeedViewModel extends BaseViewModel {
  final _postsService = AppLocator.locator<PostsService>();
  final _playbackService = AppLocator.locator<PlaybackSerivce>();
  final _animationsService = AppLocator.locator<AnimationService>();

  PageController _ttSwiperController = PageController();
  PageController get ttSwiperController => _ttSwiperController;

  int get videoPostsCount => _postsService.videosPostsCount;
  int get imagePostsCount => _postsService.imagesPostsCount;

  List<Post> get allVideoPosts => _postsService.videoPosts;
  List<Post> get allImagePosts => _postsService.imagePosts;

  int ttCurrSwipeIndex = 0;
  int ttPrevHalfSwipeIndex = 0;

  void onTTHalfSwipe(int index) async {
    ttCurrSwipeIndex = index % videoPostsCount;
    _playbackService.playAndPauseVideoBySwipe(index, ttPrevHalfSwipeIndex);
    _playbackService.videoPlaybackPreload(index);
    _handleVisibility;

    _animationsService.resetPlayAndPauseAnimation;

    ttPrevHalfSwipeIndex = ttCurrSwipeIndex;
    notifyListeners();
  }

  void get _handleVisibility {
    final int _nextByOne = ttCurrSwipeIndex + 1;
    if (ttCurrSwipeIndex > 1 && (_nextByOne < videoPostsCount)) {
      if (_playbackService.getSwipeDirection) {
        allVideoPosts[_nextByOne].playback!.videoVisibility = true;

        final int _prevByOne = ttPrevHalfSwipeIndex - 1;
        if (_prevByOne != 0) allVideoPosts[_prevByOne].playback!.videoVisibility = false;
      } else {
        final int _prevByOne = ttPrevHalfSwipeIndex + 1;
        if (_prevByOne != videoPostsCount) allVideoPosts[_prevByOne].playback!.videoVisibility = false;
        allVideoPosts[ttCurrSwipeIndex - 1].playback!.videoVisibility = true;
      }
    }
  }

  Post get getCurrentHalfSwipePost => allVideoPosts[ttCurrSwipeIndex];

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    playAndPauseAnimationController.addListener(() => notifyListeners());
    // _ttSwiperController.addListener(_ttFeedScrollListener);
  }

  // int _currentTTPostIndex = 0;
  // bool _pageIsScrolling = false;

  // void _ttFeedScrollListener() {
  //   final double? _page = _ttSwiperController.page;

  //   if (_pageIsScrolling && _page == _page!.roundToDouble()) {
  //     _currentTTPostIndex = _page.toInt();
  //     _pageIsScrolling = false;
  //   } else if (!_pageIsScrolling && _currentTTPostIndex.toDouble() != _page) {
  //     if ((_currentTTPostIndex.toDouble() - _page!).abs() > 0.05) {
  //       _pageIsScrolling = true;
  //     }
  //   }
  // }

  void onTTPostTap(Playback? playback) {
    if (playback!.videoController!.isVideoPlaying) {
      _animationsService.handlePlayAndPauseAnimation(false);
      playback.videoController!.pauseVideo;
    } else {
      _animationsService.handlePlayAndPauseAnimation(true);
      playback.videoController!.playVideo;
    }
  }

  AnimationController get playAndPauseIconAnimationController =>
      AnimationControllers.playAndPauseIconAnimationController!;
  AnimationController get playAndPauseAnimationController => AnimationControllers.playAndPauseAnimationController!;
  Animation<double> get playAndPauseAnimation => AnimationTweens.playAndPauseAnimation!;
}
