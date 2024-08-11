
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.theme, required this.onPressed,
  });

  final ColorScheme theme;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
            child: Text('Forgot Password',style: TextStyle(
              color: theme.error,
              // fontWeight: FontWeight.bold
            ),),
          ),
        )
      ],
    );
  }
}

