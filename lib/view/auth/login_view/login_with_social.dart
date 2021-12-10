import 'package:e_commerce/view/widgets/custom_social_button.dart';
import 'package:flutter/material.dart';

class LoginWithSocial extends StatelessWidget {
  const LoginWithSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          onPressed: () {},
          image: 'assets/images/Facebook.png',
          text: 'Sign in with Facebook',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomSocialButton(
          onPressed: () {},
          image: 'assets/images/Google.png',
          text: 'Sign in with Google',
        ),
      ],
    );
  }
}
