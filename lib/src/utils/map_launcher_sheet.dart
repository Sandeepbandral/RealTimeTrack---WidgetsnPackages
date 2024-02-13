import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class MapLauncherSheet {
  static Future<AvailableMap?> show(
    BuildContext context, {
    required Coords destination,
  }) async {
    List<AvailableMap> availableMaps = await MapLauncher.installedMaps;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _MapListView(
          destination: destination,
          availableMaps: availableMaps,
        );
      },
    );
  }
}

class _MapListView extends StatelessWidget {
  final Coords destination;
  final List<AvailableMap> availableMaps;

  const _MapListView({
    required this.availableMaps,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollableColumn.withSafeArea(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            'Select a Map',
            style: context.textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
        ),
        Column(
          children: ListTile.divideTiles(
            color: context.theme.dividerColor,
            tiles: availableMaps.map(
              (map) => ListTile(
                onTap: () {
                  Navigator.pop(context);
                  map.showDirections(destination: destination);
                },
                title: Text(map.mapName),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SvgPicture.asset(map.icon, height: 30.0, width: 30.0),
                ),
              ),
            ),
          ).toList(),
        ),
        const SizedBoxH10(),
      ],
    );
  }
}
