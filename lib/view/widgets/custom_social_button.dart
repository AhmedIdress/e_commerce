import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final Function() onPressed;
  final String image;
  final String text;
  const CustomSocialButton({required this.onPressed,required this.image,required this.text,}) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 77,),
          child: Row(
            children: [
              Image.asset(image),
              const Spacer(),
              CustomText(text: text, size: 15),
            ],
          ),
        ),
      ),
    );
  }
}
