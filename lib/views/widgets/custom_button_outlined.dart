import 'package:flutter/material.dart';

class CustomButtonOutlined extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  const CustomButtonOutlined({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
          side: BorderSide(color: Color(0xFFD9D9D9)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
