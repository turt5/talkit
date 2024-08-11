import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talkit/features/signup/view/pages/_signup.dart';
import 'package:talkit/features/splash/view/widgets/_logo.dart';

import '../widgets/_custom_button.dart';
import '../widgets/_custom_textfield.dart';
import '../widgets/_forgot_pass_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: theme.brightness,
      statusBarColor: theme.surface,
      systemNavigationBarColor: theme.surface,
      systemNavigationBarIconBrightness: theme.brightness,
    ));

    return Scaffold(
      backgroundColor: theme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .05,
              ),
              AppLogo(theme: theme, size: 20),
              // SizedBox(height: height*.12),
              const SizedBox(height: 20),

              SizedBox(
                height: height * .75,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'To continue, sign in to your account.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.onSurface.withOpacity(.5),
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      theme: theme,
                      iconData: Icons.email,
                      hint: "Email Address",
                      isPasswordField: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      theme: theme,
                      iconData: Icons.lock,
                      hint: "Password",
                      isPasswordField: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ForgotPasswordButton(
                      theme: theme,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      theme: theme,
                      width: double.infinity,
                      height: 55,
                      label: "Sign in",
                      onClick: () {},
                      primary: theme.primary,
                      onPrimary: theme.onPrimary,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account yet?"),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 4),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: theme.primary,
                                  // fontWeight: FontWeight.bold
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Or',
                          style:
                              TextStyle(color: theme.onSurface.withOpacity(.5)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      theme: theme,
                      width: double.infinity,
                      height: 55,
                      label: "Continue with google",
                      onClick: () {},
                      primary: Colors.grey.shade700,
                      onPrimary: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
