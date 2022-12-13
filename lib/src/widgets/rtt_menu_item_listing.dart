import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class RttMenuItemListing extends StatelessWidget {
  final List<RttMenuItem> items;

  const RttMenuItemListing({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ListView.separated(
      itemCount: items.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(height: Dimension.d0, color: Color(0xffCCD2D8));
      },
      itemBuilder: (context, index) {
        var item = items[index];
        return _buildListTile(item, textTheme);
      },
    );
  }

  Widget _buildListTile(RttMenuItem item, TextTheme textTheme) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Dimension.d4,
        vertical: Dimension.d2,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: item.icon.contains('.svg')
            ? SvgPicture.asset(
                item.icon,
                package: RealTimeTrack.name,
              )
            : Image.asset(
                item.icon,
                package: RealTimeTrack.name,
              ),
      ),
      title: Text(
        item.title,
        style: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: item.onTap,
    );
  }
}
