import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/models/post.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/ui/widgets/buttons/comments_button_widget.dart';
import 'package:social_app/ui/widgets/buttons/like_button_widget.dart';
import 'package:social_app/ui/widgets/buttons/share_button_widget.dart';
import 'package:social_app/ui/widgets/icons/play_or_pause_widget.dart';
import 'package:social_app/ui/widgets/playback/video_playback_widget.dart';
import 'package:social_app/ui/widgets/shared/profile_avatar_widget.dart';
import 'package:stacked/stacked.dart';

class TTPost extends ViewModelWidget<FeedViewModel> {
  final Post? post;

  const TTPost(this.post) : super(reactive: false);

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.onTTPostTap(this.post?.playback!),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _playback,
          _rightBar,
          _playOrPause,
          _descriptionFade,
          _usernameAndEmail,
        ],
      ),
    );
  }

  Widget get _descriptionFade => Positioned(
      left: 0.0,
      bottom: 83.0,
      child: Container(
        width: ScreenUtil.screenWidthLp - 115.0,
        height: 78.0,
        decoration: BoxDecoration(boxShadow: [
          WidgetsUtil.shadow(
            color: Colors.black.withOpacity(0.4),
            spread: 8,
            blur: 60,
          ),
        ]),
      ));

  Widget get _playOrPause => PlayOrPauseWidget();

  Widget get _playback => Positioned.fill(
        child: VideoPlaybackWidget(
          playback: this.post!.playback,
          foreground: WidgetsUtil.foregroundFade(
            Colors.black.withOpacity(0.25),
            Colors.transparent,
            alignmentStart: Alignment.centerRight,
            alignmentEnd: Alignment.centerLeft,
            stops: [0.0, 0.4],
          ),
        ),
      );

  Widget get _rightBar => Positioned(
        right: 14.0,
        bottom: AppConstants.bottomBarHeight + 31.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LikeButtonWidget(count: 8264, onPress: () {}),
            WidgetsUtil.verticalSpace(27),
            CommentsButtonWidget(count: 832, onPress: () {}),
            WidgetsUtil.verticalSpace(23),
            ShareButtonWidget(count: 128, onPress: () {}),
            WidgetsUtil.verticalSpace(28),
            ProfileAvatarWidget(size: 57.0, url: post!.user!.avatarUrl!),
          ],
        ),
      );

  Widget get _usernameAndEmail => Positioned(
        left: 14.0,
        bottom: AppConstants.bottomBarHeight + 33.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LimitedBox(
              maxWidth: ScreenUtil.screenWidthLp / 2.0 - 50.0,
              child: Text(
                '@${this.post!.user!.username}',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.quicksand(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18.0,
                  letterSpacing: -0.38,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            WidgetsUtil.verticalSpace(7),
            LimitedBox(
              maxWidth: ScreenUtil.screenWidthLp - 120.0,
              child: Text(
                'Enjoy funny cats videos worldwide and earn money 😼',
                overflow: TextOverflow.fade,
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 17.0,
                  height: 1.5,
                  letterSpacing: -0.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
}
