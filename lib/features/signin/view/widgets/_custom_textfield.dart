import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.theme, required this.isPasswordField, required this.hint, required this.iconData,
  });

  final ColorScheme theme;
  final bool isPasswordField;
  final String hint;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primary.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        children: [
          Icon(
            iconData,
            color: theme.onSurface.withOpacity(.5),
          ),
          const SizedBox(width: 12,),
          Expanded(
            child: TextField(
              obscureText: isPasswordField,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: theme.onSurface.withOpacity(.5),
                ),
                border: InputBorder.none, // Removes the underline
              ),
            ),
          ),
        ],
      ),
    );
  }
}
