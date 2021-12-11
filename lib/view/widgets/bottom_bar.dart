import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key,required this.buttonText,required this.price,required this.upperPriceText,}) : super(key: key);
  final String buttonText,price,upperPriceText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              CustomText(
                text: upperPriceText,
                size: 12,
                color: Colors.grey,
              ),
              CustomText(
                text: price,
                size: 18,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
              text: buttonText, width: 180, textSize: 18, onPressed: () {}),
        ],
      ),
    );
  }
}
