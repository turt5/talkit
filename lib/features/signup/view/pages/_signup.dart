import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talkit/features/signin/view/widgets/_custom_button.dart';
import 'package:talkit/features/signin/view/widgets/_custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
            )),
        title: const Text("Create an account"),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
                theme: theme,
                isPasswordField: false,
                hint: "Name",
                iconData: Icons.person),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                theme: theme,
                isPasswordField: false,
                hint: "Email Address",
                iconData: Icons.email),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                theme: theme,
                isPasswordField: false,
                hint: "Phone Number",
                iconData: Icons.phone),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                theme: theme,
                width: double.infinity,
                height: 55,
                label: "Date of Birth",
                onClick: () {},
                primary: theme.primary.withOpacity(.1),
                onPrimary: theme.onSurface.withOpacity(.5)),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                theme: theme,
                isPasswordField: true,
                hint: "Password",
                iconData: Icons.person),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                theme: theme,
                isPasswordField: true,
                hint: "Confirm Password",
                iconData: Icons.person),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                theme: theme,
                width: double.infinity,
                height: 200,
                label: "Profile Picture",
                onClick: () {},
                primary: theme.primary.withOpacity(.1),
                onPrimary: theme.onSurface.withOpacity(.5))
          ],
        ),
      ),
    );
  }
}
