
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/extensions/widget_extesion.dart';

class ImageRadius {
  const ImageRadius._(this.value);

  final double value;

  static const ImageRadius circle = ImageRadius._(double.infinity);

  static const ImageRadius radius = ImageRadius.radiusWithValue();

  const ImageRadius.radiusWithValue({double radius = 0}) : value = radius;
}

class ImageView extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final ImageRadius radius;

  const ImageView({
    Key? key,
    required this.imageUrl,
    this.height = 0,
    this.width = 0,
    this.radius = const ImageRadius.radiusWithValue(radius: 8),
  }) : super(key: key);

  double get borderRadius {
    return radius.value == double.infinity ? height / 2 : radius.value;
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            height: height,
            width: width,
            imageBuilder: (context, image) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              );
            },
            placeholder: (context, url) => _buildPlaceHolder(),
            errorWidget: (context, url, error) => _buildPlaceHolder(),
          )
        : _buildPlaceHolder();
  }

  Widget _buildPlaceHolder() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ).toShimmer();
  }
}
