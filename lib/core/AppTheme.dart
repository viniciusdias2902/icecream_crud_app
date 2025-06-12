import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static AppBarTheme _appBarTheme(Color backgroundColor) => AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
    centerTitle: false,
  );

  static final TextTheme textTheme = TextTheme(
    bodySmall: GoogleFonts.poppins(fontSize: 12),
    bodyMedium: GoogleFonts.poppins(fontSize: 14),
    bodyLarge: GoogleFonts.poppins(fontSize: 16),
    headlineSmall: GoogleFonts.poppins(fontSize: 24),
    headlineMedium: GoogleFonts.poppins(fontSize: 34),
    headlineLarge: GoogleFonts.poppins(fontSize: 40),
  );

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme,
    colorScheme: ColorScheme.light(
      primary: const Color(0xff7287fd),
      secondary: Color(0xffea76cb),
      tertiary: Color(0xffdd7878),
      surface: Color(0xffeff1f5),
      onSurface: Color(0xff4c4f69),
      error: Color(0xffd20f39),
    ),
    appBarTheme: _appBarTheme(const Color(0xffccd0da)),
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    textTheme: textTheme,
    colorScheme: ColorScheme.dark(
      primary: Color(0xffb4befe),
      secondary: Color(0xfff5c2e7),
      tertiary: Color(0xfff2cdcd),
      surface: Color(0xff1e1e2e),
      onSurface: Color(0xffcdd6f4),
      error: Color(0xfff38ba8),
    ),
    appBarTheme: _appBarTheme(const Color(0xff45475a)),
  );
}
