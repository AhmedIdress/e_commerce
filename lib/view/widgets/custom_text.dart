import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final int? maxLines;
  final double? height;
  final FontWeight fontWeight;
  const CustomText({
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.fontWeight=FontWeight.normal,
    this.maxLines=1,
    this.height=1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        height: height,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
