import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  CustomText({
    required this.text,
    required this.size,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
