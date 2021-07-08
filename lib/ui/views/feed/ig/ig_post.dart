import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/app/models/post.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/ui/widgets/playback/image_playback_widget.dart';
import 'package:social_app/ui/widgets/playback/video_playback_widget.dart';
import 'package:social_app/ui/widgets/shared/profile_avatar_widget.dart';
import 'package:stacked/stacked.dart';

class IGPost extends ViewModelWidget<FeedViewModel> {
  final Post? post;

  IGPost({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return Container(
      width: ScreenUtil.screenWidthLp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header,
          WidgetsUtil.verticalSpace(8.0),
          _image,
        ],
      ),
    );
  }

  Widget get _header => Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 1.0),
        child: Row(
          children: [
            ProfileAvatarWidget(
              size: 37.0,
              borderRadius: 11.0,
              url: this.post!.user!.avatarUrl!,
            ),
            WidgetsUtil.horizontalSpace(10),
            Text(
              '${this.post!.user!.username}',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.quicksand(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16.0,
                letterSpacing: -0.38,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 35.0,
              height: 35.0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 20.0,
                ),
                splashRadius: 20.0,
              ),
            ),
          ],
        ),
      );

  Radius _borderTop = Radius.circular(7.0);
  Radius _borderBottom = Radius.circular(7.0);

  Widget get _image => SizedBox(
        width: double.infinity,
        // height: ScreenUtil.screenHeightLp / 2.5,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: _borderTop,
            topRight: _borderTop,
            bottomLeft: _borderBottom,
            bottomRight: _borderBottom,
          ),
          child: ImagePlaybackWidget(imageUrl: this.post!.playback!.url),
        ),
      );
}
