import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: theme.brightness,
        statusBarColor: theme.surface,
        systemNavigationBarColor: theme.surface,
        systemNavigationBarIconBrightness: theme.brightness));

    return Scaffold(
      backgroundColor: theme.surface,
      body: SafeArea(child: Center(
        child: AppLogo(theme: theme,size: 35,),
      )),
    );
  }
}

