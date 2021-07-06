import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/data/enums.dart';
import 'package:social_app/app/debug/log.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/physics/scroll_physics.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/ui/views/feed/tt/tt_post.dart';
import 'package:social_app/ui/widgets/delayed/loading_widget.dart';
import 'package:stacked/stacked.dart';
import 'dart:io' show Platform;

class TTFeedView extends StatefulWidget {
  const TTFeedView({Key? key}) : super(key: key);

  @override
  _TTFeedViewState createState() => _TTFeedViewState();
}

class _TTFeedViewState extends State<TTFeedView> {
  final _feedViewModel = AppLocator.locator<FeedViewModel>();

  static final Radius _clipRadiusTop = Radius.circular(10.0);
  // static final Radius _clipRadiusBottom = Radius.circular(14.0);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => _feedViewModel,
      builder: (context, viewModel, _) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ClipRRect(
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
          ],
        ),
      ),
    );
  }
}
