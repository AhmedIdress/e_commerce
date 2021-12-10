import 'package:e_commerce/core/viewModel/auth_view_model.dart';
import 'package:e_commerce/view/widgets/custom_social_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithSocial extends GetWidget<AuthViewModel> {
  const LoginWithSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          onPressed: () {
            controller.facebookSignIn();
          },
          image: 'assets/images/Facebook.png',
          text: 'Sign in with Facebook',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomSocialButton(
          onPressed: () {
            controller.googleSignIn();
          },
          image: 'assets/images/Google.png',
          text: 'Sign in with Google',
        ),
      ],
    );
  }
}
