import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.theme,
    required this.width,
    required this.height,
    required this.label,
    required this.onClick,
    required this.primary,
    required this.onPrimary,
  });

  final ColorScheme theme;
  final double width;
  final double height;
  final String label;
  final VoidCallback onClick;
  final Color primary;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            label,
            style: TextStyle(
                color: onPrimary, fontWeight: FontWeight.bold, fontSize: 14),
          )),
    );
  }
}
