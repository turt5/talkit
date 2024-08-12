import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.prefixIconData,
      required this.isPassword,
      required this.theme,
      required this.controller});

  final String hint;
  final IconData prefixIconData;
  final bool isPassword;
  final ColorScheme theme;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: theme.primary.withOpacity(.1),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Icon(
            prefixIconData,
            color: theme.onSurface.withOpacity(.5),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
              child: TextField(
                controller: controller,
                obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: theme.onSurface.withOpacity(.5))),
          ))
        ],
      ),
    );
  }
}

