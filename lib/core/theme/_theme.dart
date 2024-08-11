import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme{
  static ThemeData baseLightTheme() => ThemeData(
    fontFamily:  GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      surface: Color(0xFFFAF9F6),
      onSurface: Color(0xFF000000),
      primary: Color(0xFF344e41),
      onPrimary: Color(0xFFdad7cd),
      secondary: Color(0xFF588157),
      onSecondary: Colors.white,
      tertiary: Color(0xFFa3b18a),
      onTertiary: Colors.black,
      error: Colors.red,
      onError: Colors.white
    )
  );

  static ThemeData baseDarkTheme() => ThemeData(
    fontFamily:  GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      surface: Color.fromARGB(255, 30, 30, 30),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      primary: Color.fromARGB(255, 165, 249, 207),
      onPrimary: Color.fromARGB(255, 41, 38, 28),
      secondary: Color.fromARGB(255, 129, 195, 128),
      onSecondary: Color.fromARGB(255, 0, 0, 0),
      tertiary: Color(0xFFa3b18a),
      onTertiary: Colors.black,
      error: Colors.red,
      onError: Colors.white
    )
  );
}