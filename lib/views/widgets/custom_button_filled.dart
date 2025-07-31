import 'package:flutter/material.dart';

class CustomButtonFilled extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButtonFilled({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Color(0xFF67C4A7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(4),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        ),
        child: Text(title),
      ),
    );
  }
}
