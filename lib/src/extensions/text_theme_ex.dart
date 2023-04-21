import 'package:flutter/material.dart';

extension TextThemeEx on TextTheme {
  TextStyle? get headingStyle {
    return headlineSmall?.copyWith(color: Colors.black, fontSize: 32);
  }

  TextStyle? get buttonStyle {
    return titleMedium?.copyWith(fontSize: 16);
  }

  TextStyle? get errorStyle {
    return titleSmall?.copyWith(
      fontSize: 10,
      color: Colors.red,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle? get otpCodeStyle {
    return labelLarge?.copyWith(
      fontSize: 28,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );
  }
}
