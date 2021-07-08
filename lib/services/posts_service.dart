import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/models/post.dart';
import 'package:social_app/mock_data.dart';
import 'package:social_app/services/playback_service.dart';

class PostsService {
  List<Post> _videoPosts = [];
  List<Post> get videoPosts => _videoPosts;

  List<Post> _imagePosts = [];
  List<Post> get imagePosts => _imagePosts;

  int get videosPostsCount => _videoPosts.length;
  int get imagesPostsCount => _imagePosts.length;

  set addVideoPost(Post post) => _videoPosts.add(post);
  set addImagePost(Post post) => _imagePosts.add(post);

  Future<void> loadInitialVideoPosts() async {
    for (int index = 0; index < AppConstants.initialVideoPostsCountLoad; index++) {
      await loadPost(index);
      _loadPlayback(index);
    }
  }

  Future<void> loadInitialImagePosts() async {
    for (int index = 0; index < AppConstants.initialImagePostsCountLoad; index++) {
      await loadPost(index, video: false);
      _loadPlayback(index, video: false);
    }
  }

  static void _loadPlayback(
    int index, {
    bool video = true,
  }) =>
      video
          ? AppLocator.locator<PlaybackSerivce>().videoPlaybackLoad(index)
          : AppLocator.locator<PlaybackSerivce>().imagePlaybackLoad(index);

  Future<void>? loadPost(
    int index, {
    bool video = true,
  }) async {
    if (video) {
      if (index < mockVideoPosts.length) {
        addVideoPost = mockVideoPosts[index];
      }
    } else {
      if (index < mockImagePosts.length) {
        addImagePost = mockImagePosts[index];
      }
    }
  }
}
