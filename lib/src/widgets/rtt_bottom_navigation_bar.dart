// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      items: items.map((item) {
        return BottomNavigationBarItem(
          label: item.label,
          icon: _buildImageIcon(
            item.icon,
            size: item.size,
            color: Colors.grey,
          ),
          activeIcon: _buildImageIcon(
            item.activeIcon,
            size: item.size,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildImageIcon(String imagePath, {double? size, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SvgPicture.asset(
        imagePath,
        height: size ?? 22,
        width: size ?? 22,
        package: RealTimeTrace.name,
        color: color,
      ),
    );
  }
}
