import 'package:get_it/get_it.dart';
import 'package:social_app/services/animation_service.dart';
import 'package:social_app/services/playback_service.dart';
import 'package:social_app/services/posts_service.dart';
import 'package:social_app/ui/views/bbar/bottom_bar_view_model.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class AppLocator {
  static GetIt locator = GetIt.instance;

  static void setupLocator() {
    locator.registerLazySingleton<NavigationService>(() => NavigationService());
    locator.registerLazySingleton<AnimationService>(() => AnimationService());
    locator.registerLazySingleton<PlaybackSerivce>(() => PlaybackSerivce());
    locator.registerLazySingleton<PostsService>(() => PostsService());

    locator.registerSingleton<FeedViewModel>(FeedViewModel());
    locator.registerSingleton<BottomBarViewModel>(BottomBarViewModel());
  }
}
