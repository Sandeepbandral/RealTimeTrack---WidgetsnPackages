import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/extensions/text_theme_extesion.dart';
import 'package:real_time_track_package/src/widgets/sized_box.dart';

class HeadingText extends StatelessWidget {
  final String title;
  const HeadingText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Text(title, style: textTheme.headingStyle);
  }
}

class CheckAccountRichText extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CheckAccountRichText({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    ColorScheme colorScheme = theme.colorScheme;

    return Text.rich(
      TextSpan(
        text: title,
        style: textTheme.bodyText1?.copyWith(color: Colors.black),
        children: [
          const WidgetSpan(child: SizedBoxW10()),
          TextSpan(
            text: subTitle,
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          )
        ],
      ),
    );
  }
}
