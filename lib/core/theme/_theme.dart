import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  static ThemeData baseLightTheme() => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: ColorScheme.light(
          brightness: Brightness.dark,
          primary: const Color(0xFF1A3636),
          onPrimary: const Color(0xFFD6BD98),
          secondary: const Color(0xFF40534C),
          onSecondary: Colors.white,
          tertiary: const Color(0xFF677D6A),
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.grey.shade200,
          onSurface: Colors.black));

  static ThemeData baseDarkTheme() => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorScheme: const ColorScheme.dark(
          brightness: Brightness.light,
          onPrimary:  Color(0xFF1A3636),
          primary:  Color(0xFFD6BD98),
          onSecondary:  Color(0xFF40534C),
          secondary: Colors.white,
          tertiary:  Color(0xFF677D6A),
          error: Colors.red,
          onError: Colors.white,
          surface:  Color.fromARGB(255, 26, 26, 26),
          onSurface: Colors.white));
}
