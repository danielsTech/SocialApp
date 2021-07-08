import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePlaybackWidget extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImagePlaybackWidget({
    Key? key,
    this.fit,
    this.width,
    this.height,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double? _imageWidth = width ?? null;
    final double? _imageHeight = height ?? null;

    int? _imageDiskCacheWidth;
    int? _imageDiskCacheHeight;

    if (_imageWidth != null && _imageHeight != null) {
      _imageDiskCacheWidth = _imageWidth.toInt() * 4;
      _imageDiskCacheHeight = _imageHeight.toInt() * 4;
    }

    return CachedNetworkImage(
      imageUrl: this.imageUrl ?? '',
      fit: fit ?? BoxFit.cover,
      width: _imageWidth,
      height: _imageHeight,
      maxWidthDiskCache: _imageDiskCacheWidth,
      maxHeightDiskCache: _imageDiskCacheHeight,
    );
  }
}
