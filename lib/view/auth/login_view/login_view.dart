import 'package:e_commerce/view/auth/login_view/login_with_email.dart';
import 'package:e_commerce/view/auth/login_view/login_with_social.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginWithEmail(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: CustomText(
                  text: '-or-'.toUpperCase(),
                  size: 20,
                ),
              ),
              const LoginWithSocial(),
            ],
          ),
        ),
      ),
    );
  }
}
