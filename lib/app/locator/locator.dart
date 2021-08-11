import 'package:get_it/get_it.dart';
import 'package:social_app/services/animation_service.dart';
import 'package:social_app/services/camera_service.dart';
import 'package:social_app/services/path_service.dart';
import 'package:social_app/services/playback_service.dart';
import 'package:social_app/services/posts_service.dart';
import 'package:social_app/ui/views/camera/camera_view_model.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class AppLocator {
  static GetIt locator = GetIt.instance;

  static void setupLocator() {
    // SERVICES
    locator.registerLazySingleton<NavigationService>(() => NavigationService());
    locator.registerLazySingleton<AnimationService>(() => AnimationService());
    locator.registerLazySingleton<PlaybackSerivce>(() => PlaybackSerivce());
    locator.registerLazySingleton<CameraService>(() => CameraService());
    locator.registerLazySingleton<PostsService>(() => PostsService());
    locator.registerLazySingleton<PathService>(() => PathService());

    // VIEW MODELS
    locator.registerSingleton<FeedViewModel>(FeedViewModel());
    locator.registerSingleton<CameraViewModel>(CameraViewModel());
  }
}
