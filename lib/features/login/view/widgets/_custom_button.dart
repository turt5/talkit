import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.theme,
      required this.width,
      required this.height,
      required this.primaryColor,
      required this.foreGroundColor,
      required this.onPressed,
      required this.label,
      this.isLoading});
  final ColorScheme theme;
  final double width;
  final double height;
  final Color primaryColor;
  final Color foreGroundColor;
  final VoidCallback onPressed;
  final String label;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: isLoading ==true? Colors.grey.withOpacity(.1) : primaryColor,
              foregroundColor: foreGroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: isLoading ==true
              ? CupertinoActivityIndicator(
                radius: 10,
                color: theme.primary,
              )
              : Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
    );
  }
}
