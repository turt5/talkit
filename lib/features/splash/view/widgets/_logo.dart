import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.theme, required this.size,
  });

  final ColorScheme theme;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Talk',style: GoogleFonts.silkscreen(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: theme.primary
        ),),
        Text('it',style: GoogleFonts.silkscreen(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: theme.primary.withOpacity(.5)
        ),),
      ],
    );
  }
}
