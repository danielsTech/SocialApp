import 'package:flutter/material.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/physics/scroll_physics.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/ui/views/feed/tt/tt_post.dart';
import 'package:stacked/stacked.dart';

class TTFeedView extends StatefulWidget {
  const TTFeedView({Key? key}) : super(key: key);

  @override
  _TTFeedViewState createState() => _TTFeedViewState();
}

class _TTFeedViewState extends State<TTFeedView> {
  final _feedViewModel = AppLocator.locator<FeedViewModel>();

  static final Radius _clipRadiusTop = Radius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => _feedViewModel,
      builder: (context, viewModel, _) => Scaffold(
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: _clipRadiusTop,
            topRight: _clipRadiusTop,
          ),
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _feedViewModel.ttSwiperController,
            physics: CustomScrollPhysics.mainTTFeedCarouselScrollPhysics,
            onPageChanged: (index) => _feedViewModel.onTTHalfSwipe(index),
            itemCount: _feedViewModel.videoPostsCount,
            itemBuilder: (context, index) {
              final _post = _feedViewModel.getCurrentVideoPost(index);
              return TTPost(_post);
            },
          ),
        ),
      ),
    );
  }
}
