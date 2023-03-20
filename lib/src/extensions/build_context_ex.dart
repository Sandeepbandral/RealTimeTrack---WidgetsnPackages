import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/utils/snack_bar_utils.dart';

extension BuildContextEx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  void showSnackBar(String message, {Duration? duration}) {
    SnackBar snackBar = SnackBarUtils.snackBar(
      message: message,
      duration: duration,
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
