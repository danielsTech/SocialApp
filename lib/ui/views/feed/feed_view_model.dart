import 'package:flutter/cupertino.dart';
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

  PageController _ttSwiperController = PageController(viewportFraction: 0.99999);
  PageController get ttSwiperController => _ttSwiperController;

  int get videoPostsCount => _postsService.videosPostsCount;
  int get imagePostsCount => _postsService.imagesPostsCount;

  List<Post> get allVideoPosts => _postsService.videoPosts;
  List<Post> get allImagePosts => _postsService.imagePosts;

  Post? getCurrentVideoPost(int index) => _postsService.videoPosts[index];

  int _ttPrevHalfSwipeIndex = 0;

  void onTTHalfSwipe(int index) async {
    _playbackService.playAndPauseVideoBySwipe(index, _ttPrevHalfSwipeIndex);
    await _playbackService.videoPlaybackPreload(index);

    _animationsService.resetPlayAndPauseAnimation;

    _ttPrevHalfSwipeIndex = index;
    notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _animationsService.playAndPauseAnimationController.addListener(() => notifyListeners());
    _ttSwiperController.addListener(_ttFeedScrollListener);
  }

  int _currentTTPostIndex = 0;
  bool _pageIsScrolling = false;

  void _ttFeedScrollListener() {
    if (_pageIsScrolling && _ttSwiperController.page == _ttSwiperController.page!.roundToDouble()) {
      _currentTTPostIndex = _ttSwiperController.page!.toInt();
      _pageIsScrolling = false;
    } else if (!_pageIsScrolling && _currentTTPostIndex.toDouble() != _ttSwiperController.page) {
      if ((_currentTTPostIndex.toDouble() - _ttSwiperController.page!).abs() > 0.05) {
        _pageIsScrolling = true;
      }
    }
  }

  void onTTPostTap(Playback? playback) {
    if (playback!.videoController!.isVideoPlaying) {
      _animationsService.handlePlayAndPauseAnimation(false);
      playback.videoController!.pauseVideo;
    } else {
      _animationsService.handlePlayAndPauseAnimation(true);
      playback.videoController!.playVideo;
    }
  }

  AnimationController get playAndPauseIconAnimationController => _animationsService.playAndPauseIconAnimationController;
  AnimationController get playAndPauseAnimationController => _animationsService.playAndPauseAnimationController;
  Animation<double> get playAndPauseAnimation => _animationsService.playAndPauseAnimation;

  @override
  void dispose() {
    super.dispose();
    playAndPauseAnimationController.dispose();
    playAndPauseIconAnimationController.dispose();
  }
}
