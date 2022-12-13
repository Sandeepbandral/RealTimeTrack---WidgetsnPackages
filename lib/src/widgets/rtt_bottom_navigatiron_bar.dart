import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class RttBottomNavigationBarItem {
  final String label;
  final String icon;
  final String activeIcon;
  final double? size;

  RttBottomNavigationBarItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    this.size,
  });
}

class RttBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<RttBottomNavigationBarItem> items;
  final ValueChanged<int> onTap;

  const RttBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: items.map((item) {
        return BottomNavigationBarItem(
          label: item.label,
          icon: _buildImageIcon(
            item.icon,
            size: item.size,
          ),
          activeIcon: _buildImageIcon(
            item.activeIcon,
            size: item.size,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildImageIcon(String imagePath, {double? size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SvgPicture.asset(
        imagePath,
        height: size ?? 22,
        width: size ?? 22,
        package: RealTimeTrack.name,
      ),
    );
  }
}
