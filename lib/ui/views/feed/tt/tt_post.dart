import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/app/data/const.dart';
import 'package:social_app/app/models/post.dart';
import 'package:social_app/app/utils/screen.dart';
import 'package:social_app/app/utils/widgets.dart';
import 'package:social_app/main.dart';
import 'package:social_app/ui/views/account/account_view.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:social_app/ui/widgets/delayed/loading_widget.dart';
import 'package:social_app/ui/widgets/icons/play_or_pause_widget.dart';
import 'package:social_app/ui/widgets/playback/video_playback_widget.dart';
import 'package:social_app/ui/widgets/user/profile_avatar_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class TTPost extends ViewModelWidget<FeedViewModel> {
  Post? post;

  TTPost(this.post) : super(reactive: true);

  @override
  Widget build(BuildContext context, FeedViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.onTTPostTap(this.post?.playback!),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _playback,
          Positioned(
              left: 0.0,
              bottom: 83.0,
              child: Container(
                width: ScreenUtil.screenWidthLp - 115.0,
                height: 78.0,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 60.0,
                    spreadRadius: 8.0,
                    offset: Offset.zero,
                  )
                ]),
              )),
          PlayOrPauseWidget(),
          _rightBar,
          _usernameAndEmail,
        ],
      ),
    );
  }

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
        bottom: Constants.bottomBarHeight + 31.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  size: 40.0,
                  color: Colors.white,
                ),
                Text(
                  '78.3K',
                  style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: 27.0),
            Column(
              children: [
                Icon(
                  Icons.comment_outlined,
                  size: 38.0,
                  color: Colors.white,
                ),
                Text(
                  '4.8K',
                  style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: 23.0),
            InkWell(
              onTap: () {
                // Navigator.push(_ctx!, new MaterialPageRoute(builder: (BuildContext context) => new ListViewPage()));
              },
              child: Column(
                children: [
                  Icon(Icons.send_rounded, size: 37.0, color: Colors.white),
                  SizedBox(height: 2.0),
                  Text(
                    '0.9K',
                    style: TextStyle(color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 28.0),
            ProfileAvatarWidget(
              size: 57.0,
              url: post!.user!.avatarUrl!,
            ),
          ],
        ),
      );

  Widget get _usernameAndEmail => Positioned(
        left: 14.0,
        bottom: Constants.bottomBarHeight + 33.0,
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
            SizedBox(height: 7.0),
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
