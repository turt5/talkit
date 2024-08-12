import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkit/features/login/view/pages/_login_page.dart';
import 'package:talkit/features/splash/controller/_change_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: theme.surface,
        systemNavigationBarColor: theme.surface,
         statusBarIconBrightness: theme.brightness,
        systemNavigationBarIconBrightness: Brightness.dark));

    changeScreenAutomatically(context);

    return Scaffold(
      backgroundColor: theme.surface,
      body: SafeArea(
          child: Center(
        child: AppLogo(theme: theme),
      )),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Talk',
          style: GoogleFonts.silkscreen(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: theme.primary),
        ),
        Text(
          'it',
          style: GoogleFonts.silkscreen(
              fontSize: 30, fontWeight: FontWeight.bold,color: theme.onSurface),
        ),
      ],
    );
  }
}
