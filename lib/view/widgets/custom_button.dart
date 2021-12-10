import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String text;
  final double textSize;
  final Function() onPressed;
  const CustomButton({
    required this.text,
    required this.width,
    required this.textSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: CustomText(
          text: text.toUpperCase(),
          size: textSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
