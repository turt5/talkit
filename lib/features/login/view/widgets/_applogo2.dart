import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo2 extends StatelessWidget {
  const AppLogo2({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Talk',
            style: GoogleFonts.silkscreen(
                color: theme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          Text(
            'it',
            style: GoogleFonts.silkscreen(
                color: theme.tertiary,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          )
        ],
      ),
    );
  }
}
