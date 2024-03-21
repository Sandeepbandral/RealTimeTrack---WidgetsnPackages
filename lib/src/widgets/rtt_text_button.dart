import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/constants/dimension.dart';
import 'package:real_time_track_package/src/widgets/sized_box.dart';

class RttTextButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Color? color;
  final double? fontSize;
  final VoidCallback? onPressed;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextDirection? direction;
  final double? radius;

  const RttTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.direction,
    this.radius,
    this.color,
  }) : icon = null;

  const RttTextButton.icon({
    super.key,
    required this.label,
    required this.icon,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.direction,
    this.radius,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextButton(
      clipBehavior: Clip.antiAlias,
      style: TextButton.styleFrom(
        foregroundColor: color ?? theme.colorScheme.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: radius == 0
              ? BorderRadius.zero
              : BorderRadius.circular(radius ?? Dimension.d2),
        ),
        textStyle: theme.textTheme.titleMedium?.copyWith(
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.w600,
          decoration: decoration,
        ),
        padding: const EdgeInsets.symmetric(horizontal: Dimension.d2),
      ),
      onPressed: onPressed,
      child: icon == null
          ? Text(label)
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: direction,
              children: [
                icon ?? const SizedBox.shrink(),
                const SizedBoxW5(),
                Text(label),
              ],
            ),
    );
  }
}
