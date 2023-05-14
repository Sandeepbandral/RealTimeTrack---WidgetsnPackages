import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class ImagePickerSourceSheet extends StatelessWidget {
  const ImagePickerSourceSheet._();

  static Future<ImageSource?> show(BuildContext context) async {
    return await showModalBottomSheet<ImageSource?>(
      context: context,
      builder: (context) => const ImagePickerSourceSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableColumn.withSafeArea(
      isScrollable: false,
      mainAxisSize: MainAxisSize.min,
      padding: const EdgeInsets.only(top: 10),
      children: [
        _ImageSourceListTile(
          icon: RttAssets.camera,
          title: 'Take Phone',
          source: ImageSource.camera,
        ),
        _ImageSourceListTile(
          icon: RttAssets.picture,
          title: 'Choose from phone',
          source: ImageSource.gallery,
        )
      ],
    );
  }
}

class _ImageSourceListTile extends StatelessWidget {
  final String icon;
  final String title;
  final ImageSource source;

  const _ImageSourceListTile({
    required this.icon,
    required this.title,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          icon,
          package: RealTimeTrac.name,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
      onTap: () => Navigator.pop(context, source),
    );
  }
}
