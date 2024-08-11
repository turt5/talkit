import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkit/features/signin/view/pages/_signin.dart';
import 'package:talkit/features/splash/view/pages/_splash.dart';

import 'core/theme/_theme.dart';

void main()async{
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: Apptheme.baseLightTheme(),
      darkTheme: Apptheme.baseDarkTheme(),
      themeMode: ThemeMode.system,
      home: SignInPage(),
    );
  }
}