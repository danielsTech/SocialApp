import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePlaybackWidget extends StatelessWidget {
  final String? imageUrl;

  const ImagePlaybackWidget({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.imageUrl ?? '',
      fit: BoxFit.cover,
    );
  }
}
