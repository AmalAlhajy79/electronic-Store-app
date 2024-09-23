import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color colorText;
  final TextDecoration? underLine;

  const TextUtils({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.colorText,
    this.underLine
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: colorText,
          fontWeight: fontWeight,
           decoration:underLine
      ),
    );
  }
}
