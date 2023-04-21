import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/constants/dimension.dart';

class RttThemeData {
  RttThemeData._();

  static const Color _lightFillColor = Colors.black;
  static const Color _darkFillColor = Colors.white;

  static const String _gilroy = 'Gilroy';

  static ThemeData lightThemeData = themeData(lightColorScheme);

  static Color darkGrey = const Color(0xffA0AAB2);

  static Color lightGrey = const Color(0xffCCD2D8);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      fontFamily: _gilroy,
      unselectedWidgetColor: lightGrey.withOpacity(0.7),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.onBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: _textTheme.titleLarge?.copyWith(
          fontSize: 18,
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: colorScheme.primary.withOpacity(0.12),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.background,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: _textTheme.labelLarge?.copyWith(
          fontSize: 12,
          color: colorScheme.primary,
        ),
        unselectedLabelStyle: _textTheme.labelLarge?.copyWith(
          fontSize: 12,
          color: const Color(0xffBBBFD0),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium?.apply(color: _darkFillColor),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        modalElevation: 0,
        modalBackgroundColor: Colors.white,
        modalBarrierColor: Colors.black.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimension.d4),
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static const Color _primary = Color(0xFF0EB002);

  static const Color secondryBackground = Color(0xffEAF2F4);

  static const Color _background = Colors.white;

  static ColorScheme lightColorScheme = const ColorScheme(
    primary: _primary,
    onPrimary: _primary,
    primaryContainer: _background,
    secondary: _primary,
    onSecondary: _primary,
    secondaryContainer: _background,
    background: Colors.white,
    onBackground: Colors.white,
    surface: _background,
    error: Colors.red,
    onError: Colors.red,
    onSurface: _background,
    brightness: Brightness.light,
  );

  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;

  static const TextTheme _textTheme = TextTheme(
    headlineMedium: TextStyle(fontWeight: _semiBold, fontSize: 20.0),
    bodySmall: TextStyle(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: TextStyle(fontWeight: _medium, fontSize: 16.0),
    titleMedium: TextStyle(fontWeight: _medium, fontSize: 16.0),
    labelSmall: TextStyle(fontWeight: _medium, fontSize: 12.0),
    bodyLarge: TextStyle(fontWeight: _regular, fontSize: 14.0),
    titleSmall: TextStyle(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: TextStyle(fontWeight: _regular, fontSize: 16.0),
    titleLarge: TextStyle(fontWeight: _bold, fontSize: 16.0),
    labelLarge: TextStyle(fontWeight: _semiBold, fontSize: 14.0),
    
  );

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    });
  }
}
