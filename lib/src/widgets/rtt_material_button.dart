import 'package:flutter/material.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class RttMaterialButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool outlined;
  final double? borderWidth;
  final double? radius;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final Color? textColor;
  final TextDirection? textDirection;

  const RttMaterialButton({
    super.key,
    required this.label,
    this.color,
    this.fontSize,
    this.height,
    this.padding,
    this.borderWidth,
    this.fontWeight,
    required this.onPressed,
    this.width,
    this.radius,
    this.textColor,
  })  : outlined = false,
        borderColor = null,
        icon = null,
        textDirection = null;

  const RttMaterialButton.outlined({
    super.key,
    required this.label,
    this.width,
    this.color,
    this.fontSize,
    this.height,
    this.borderWidth,
    this.fontWeight,
    this.padding,
    required this.onPressed,
    this.radius,
    this.icon,
    this.borderColor,
    this.textColor,
  })  : outlined = true,
        textDirection = null;

  const RttMaterialButton.icon({
    super.key,
    required this.label,
    required this.icon,
    this.width,
    this.color,
    this.fontSize,
    this.height,
    this.borderWidth,
    this.fontWeight,
    this.padding,
    required this.onPressed,
    this.radius,
    this.textColor,
    this.textDirection,
  })  : outlined = false,
        borderColor = null;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = theme.colorScheme;
    Size size = MediaQuery.of(context).size;

    Color textColor = outlined
        ? (color ?? colorScheme.primary)
        : this.textColor ?? Colors.white;
    Color backgroundColor =
        outlined ? Colors.white : (color ?? colorScheme.primary);

    bool enabled = onPressed != null;

    return SizedBox(
      width: width ?? size.width,
      child: MaterialButton(
        textColor: textColor,
        color: backgroundColor,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        height: height ?? 55,
        elevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        splashColor: textColor.withOpacity(0.1),
        highlightColor: textColor.withOpacity(0.1),
        disabledTextColor: textColor.withOpacity(0.5),
        disabledColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? Dimension.d4),
          side: outlined
              ? BorderSide(
                  color: borderColor ?? textColor, width: borderWidth ?? 1)
              : BorderSide.none,
        ),
        onPressed: enabled
            ? () {
                FocusScope.of(context).requestFocus(FocusNode());
                onPressed?.call();
              }
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: textDirection,
          children: [
            Text(
              label,
              style: theme.textTheme.buttonStyle?.copyWith(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
            if (icon != null) ...[
              const SizedBoxW10(),
              icon ?? const SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }
}
