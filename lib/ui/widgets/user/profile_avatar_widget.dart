import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:social_app/ui/views/feed/feed_view_model.dart';
import 'package:stacked/stacked.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String? url;
  final double? size;
  final bool ripple;

  final double? borderRadius;

  const ProfileAvatarWidget({
    this.url,
    this.borderRadius = 20.0,
    this.ripple = false,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => FeedViewModel(),
      builder: (context, viewModel, _) => Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4.0,
                  spreadRadius: 5.0,
                  offset: Offset.zero,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(this.borderRadius!),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: this.size,
                height: this.size,
                imageUrl: this.url ?? '',
                maxWidthDiskCache: this.size!.toInt() * 4,
                maxHeightDiskCache: this.size!.toInt() * 4,
                // fadeInDuration: AnimationDurations.profileAvatarFadeInAnimationDuration,
                // fadeOutDuration: AnimationDurations.profileAvatarFadeInAnimationDuration,
              ),
            ),
          ),
          _border,
        ],
      ),

      // builder: (context, viewModel, _) => Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     this.ripple
      //         ? Container(
      //             width: this.size,
      //             height: this.size,
      //             decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.2)),
      //           ).scale(viewModel.postProfileAvatarRippleAnimation.value).opacity(viewModel.profileRippleOpacity)
      //         : const SizedBox.shrink(),
      //     this.url != null
      // ? Stack(
      //     alignment: Alignment.center,
      //     overflow: Overflow.visible,
      //     children: [
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(80.0),
      //         child: CachedNetworkImage(
      //           fit: BoxFit.cover,
      //           width: this.size,
      //           height: this.size,
      //           imageUrl: this.url,
      //           fadeInDuration: AnimationDurations.profileAvatarFadeInAnimationDuration,
      //           fadeOutDuration: AnimationDurations.profileAvatarFadeInAnimationDuration,
      //           placeholder: (context, _) => ProfileAvatarLoadingWidget(size: this.size),
      //         ),
      //       ),
      //       _border,
      //     ],
      //   )
      //         : EmptyProfileAvatarWidget(size: this.size),
      //   ],
      // ),
    );
  }

  Widget get _border => Container(
        width: this.size,
        height: this.size,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(this.borderRadius! - 1.5),
          border: Border.all(color: Colors.white, width: 0.7),
        ),
      );
}
