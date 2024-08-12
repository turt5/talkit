import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkit/features/home/view/pages/_homepage.dart';
import 'package:talkit/features/login/controller/_login_provider.dart';
import 'package:talkit/features/register/view/pages/_register_page.dart';
import 'package:talkit/services/login/_firebase_login.dart';

import '../widgets/_applogo2.dart';
import '../widgets/_custom_button.dart';
import '../widgets/_custom_textfield.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: theme.surface,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: theme.brightness,
        systemNavigationBarIconBrightness: Brightness.dark));

    final read = ref.watch(loginProver);
    final write = ref.read(loginProver);

    return Scaffold(
      backgroundColor: theme.surface,
      body: SafeArea(
          child: Column(
        children: [
          AppLogo2(theme: theme),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'To continue, login into your account.',
                  style: TextStyle(color: theme.primary.withOpacity(.5)),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hint: "Email",
                    prefixIconData: Icons.email,
                    isPassword: false,
                    theme: theme,
                    controller: _emailController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hint: "Password",
                    prefixIconData: Icons.email,
                    isPassword: true,
                    theme: theme,
                    controller: _passwordController),
                const SizedBox(
                  height: 13,
                ),
                CustomButton(
                    theme: theme,
                    width: double.infinity,
                    height: 55,
                    primaryColor: theme.primary,
                    label: "Login",
                    isLoading: read.getLoadingData,
                    foreGroundColor: theme.onPrimary,
                    onPressed: () async {
                      FirebaseLogin firebaseLogin = FirebaseLogin();
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();

                      write.setLoadingData = true;

                      if (email.isNotEmpty && password.isNotEmpty) {
                        if (!EmailValidator.validate(email)) {
                          write.setLoadingData = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: theme.primary,
                              content: Text(
                                'Enter a valid email!',
                                style: TextStyle(color: theme.onPrimary),
                              )));

                          return;
                        }

                        Map<String, dynamic>? response =
                            await firebaseLogin.loginUser(email, password);

                        if (response == null) {
                          write.setLoadingData = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: theme.primary,
                              content: Text(
                                'Something went wrong!',
                                style: TextStyle(color: theme.onPrimary),
                              )));

                          return;
                        }

                        if (response.containsKey('error')) {
                          write.setLoadingData = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: theme.primary,
                              content: Text(
                                '${response['error']}',
                                style: TextStyle(color: theme.onPrimary),
                              )));
                          return;
                        }

                        write.setLoadingData = false;
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HomePage()));
                      }else{
                         write.setLoadingData = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: theme.primary,
                              content: Text(
                                'Please fill all the data!',
                                style: TextStyle(color: theme.onPrimary),
                              )));
                          return;
                      }
                    }),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account yet?"),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.primary),
                        ))
                  ],
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
