import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  CustomText({
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.fontWeight=FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
