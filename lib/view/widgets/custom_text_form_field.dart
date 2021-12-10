import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final bool obscureText;
  final String initialValue;
  const CustomTextFormField({
    required this.text,
    required this.keyboardType,
    this.obscureText = false,
    this.initialValue='',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          CustomText(
            text: text,
            size: 15.0,
            color: Colors.grey,
          ),
          TextFormField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            initialValue: initialValue,
          ),
        ],
      ),
    );
  }
}
