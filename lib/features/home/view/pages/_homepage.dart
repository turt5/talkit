import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkit/features/home/controller/_home_provider.dart';
import 'package:talkit/features/login/view/widgets/_custom_button.dart';
import 'package:talkit/services/login/_firebase_login.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: theme.surface,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: theme.brightness,
        systemNavigationBarIconBrightness: Brightness.dark));
    final read = ref.watch(homeProvider);
    final Wrap = ref.read(homeProvider);

    return Scaffold(
      backgroundColor: theme.surface,
      body: SafeArea(
          child: FutureBuilder(
              future: read.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CupertinoActivityIndicator(
                      radius: 12,
                      color: theme.primary,
                    ),
                  );
                } else if (snapshot.hasData) {
                  final user = snapshot.data!;

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${user['name']}"),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            theme: theme,
                            width: 250,
                            height: 55,
                            primaryColor: Colors.red,
                            foreGroundColor: Colors.white,
                            onPressed: () {
                              FirebaseLogin firebaseLogin = FirebaseLogin();
                              firebaseLogin.logoutUser(context);
                            },
                            label: "Logout")
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                }
              })),
    );
  }
}
