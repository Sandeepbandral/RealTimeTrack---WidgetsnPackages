import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class PhotoViewer {
  const PhotoViewer._();

  static void show(BuildContext context, String url) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, a1, a2) {
          return HeroPhotoViewRouteWrapper(
            heroTag: url,
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            imageProvider: NetworkImage(url),
          );
        },
      ),
    );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  final ImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final String heroTag;

  const HeroPhotoViewRouteWrapper({
    super.key,
    required this.heroTag,
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: SecondaryAppBar(context, title: ''),
      body: Container(
        constraints: BoxConstraints.expand(height: context.height),
        child: PhotoView(
          imageProvider: imageProvider,
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          filterQuality: FilterQuality.high,
          loadingBuilder: (context, event) {
            return Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(height: context.height),
              child: Loader.circularProgressIndicator(),
            );
          },
          heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
        ),
      ),
    );
  }
}
