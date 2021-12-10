import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/main_view/main_view.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  CustomText(text: 'Welcome,', size: 35.0),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomText(
                    text: 'Sign in to continue',
                    size: 16.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(const RegisterView());
                },
                child: CustomText(text: 'Sign up', size: 18.0,color: primaryColor,),
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          const CustomTextFormField(
            text: 'Email',
            keyboardType: TextInputType.emailAddress,
            initialValue: 'iamdavid@gmail.com',
          ),
          const SizedBox(
            height: 25.0,
          ),
          const CustomTextFormField(
            text: 'Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            initialValue: 'facebook12',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Forget Password?',
                  size: 14.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomButton(
              text: 'sign in',
              width: double.infinity,
              textSize: 18.0,
              onPressed: (){
                Get.to(const MainView());
              },
            ),
          ),
        ],
      ),
    );
  }
}