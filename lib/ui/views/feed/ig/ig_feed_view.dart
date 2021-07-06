import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/locator/locator.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/ui/views/feed/ig/ig_post.dart';
import 'package:stacked/stacked.dart';

class IGFeedView extends StatelessWidget {
  IGFeedView({Key? key}) : super(key: key);

  final _feedViewModel = AppLocator.locator<FeedViewModel>();

  static final Radius _clipRadiusTop = Radius.circular(22.0);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.nonReactive(
      disposeViewModel: false,
      viewModelBuilder: () => _feedViewModel,
      builder: (context, viewModel, _) => Scaffold(
        body: Container(
          margin: const EdgeInsets.only(bottom: Constants.bottomBarHeight),
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 10.0, top: 8.0, left: 4.0, right: 4.0),
            itemCount: _feedViewModel.imagePostsCount,
            separatorBuilder: (context, index) => WidgetsUtil.verticalSpace(20.0),
            itemBuilder: (context, index) => IGPost(post: _feedViewModel.allImagePosts[index]),
          ),
        ),
      ),
    );
  }
}
