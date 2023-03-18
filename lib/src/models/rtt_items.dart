import 'package:flutter/material.dart';

class RttMenuItem {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const RttMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
