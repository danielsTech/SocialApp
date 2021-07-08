import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/services/posts_service.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  final _postsService = AppLocator.locator<PostsService>();

  bool _appLoaded = false;
  bool get appLoaded => _appLoaded;

  set makeAppLoaded(bool loaded) {
    _appLoaded = loaded;
    notifyListeners();
  }

  Future<Null> appInitialLoad() async {
    await _postsService.loadInitialVideoPosts();
    // _postsService.loadInitialImagePosts();
    makeAppLoaded = true;
  }
}
