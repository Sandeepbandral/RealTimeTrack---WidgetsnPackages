import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealTimeTrackThemeData {
  RealTimeTrackThemeData._();

  static const Color _lightFillColor = Colors.black;
  static const Color _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium?.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF0EB002),
    primaryContainer: Color(0xFFEAF2F4),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.khula(fontWeight: _bold, fontSize: 20.0),
    bodySmall: GoogleFonts.khula(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: GoogleFonts.khula(fontWeight: _medium, fontSize: 16.0),
    titleMedium: GoogleFonts.khula(fontWeight: _medium, fontSize: 16.0),
    labelSmall: GoogleFonts.khula(fontWeight: _medium, fontSize: 12.0),
    bodyLarge: GoogleFonts.khula(fontWeight: _regular, fontSize: 14.0),
    titleSmall: GoogleFonts.khula(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: GoogleFonts.khula(fontWeight: _regular, fontSize: 16.0),
    titleLarge: GoogleFonts.khula(fontWeight: _bold, fontSize: 16.0),
    labelLarge: GoogleFonts.khula(fontWeight: _semiBold, fontSize: 14.0),
  );
}
