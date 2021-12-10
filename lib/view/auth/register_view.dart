import 'package:e_commerce/view/auth/login_view/login_view.dart';
import 'package:e_commerce/view/main_view/main_view.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context:context),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Get.to(const LoginView());
                  },
                ),
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:'Sign Up',
                      size: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 40),
                      child: CustomTextFormField(
                        initialValue: 'David Spade',
                        keyboardType: TextInputType.name,
                        text: 'Name',
                      ),
                    ),
                    const CustomTextFormField(
                      initialValue: 'iamdavid@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      text: 'Email',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 40,
                      ),
                      child: CustomTextFormField(
                        initialValue: 'facebook12',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        text: 'Email',
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Get.to(const MainView());
                      },
                      text: 'sign up'.toUpperCase(),
                      textSize: 18.0, width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
