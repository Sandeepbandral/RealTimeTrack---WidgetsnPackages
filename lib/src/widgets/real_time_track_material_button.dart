import 'package:flutter/material.dart';

import 'sized_box.dart';

class RealTimeTrackMaterialButton extends StatelessWidget {
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
  final FontWeight? fontWeight;

  const RealTimeTrackMaterialButton({
    Key? key,
    required this.label,
    this.color,
    this.fontSize,
    this.height,
    this.padding,
    this.borderWidth,
    this.fontWeight,
    required this.onPressed,
    this.width,
  })  : outlined = false,
        icon = null,
        super(key: key);

  const RealTimeTrackMaterialButton.outlined({
    Key? key,
    required this.label,
    this.width,
    this.color,
    this.fontSize,
    this.height,
    this.borderWidth,
    this.fontWeight,
    this.padding,
    required this.onPressed,
  })  : outlined = true,
        icon = null,
        super(key: key);

  const RealTimeTrackMaterialButton.icon({
    Key? key,
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
  })  : outlined = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = theme.colorScheme;
    Size size = MediaQuery.of(context).size;

    Color textColor = outlined ? (color ?? colorScheme.primary) : Colors.white;
    Color backgroundColor =
        outlined ? Colors.white : (color ?? colorScheme.primary);

    bool enabled = onPressed != null;

    return SizedBox(
      width: width ?? size.width,
      child: MaterialButton(
        textColor: textColor,
        color: backgroundColor,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        height: height ?? 60,
        elevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        splashColor: textColor.withOpacity(0.1),
        highlightColor: textColor.withOpacity(0.1),
        disabledTextColor: textColor.withOpacity(0.5),
        disabledColor: backgroundColor,
        shape: StadiumBorder(
          side: outlined
              ? BorderSide(color: textColor, width: borderWidth ?? 1)
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
          children: [
            Text(label, style: theme.textTheme.labelLarge),
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
