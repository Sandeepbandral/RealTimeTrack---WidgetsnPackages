import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;
}
