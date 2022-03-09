import 'package:e_commerce/core/viewModel/auth_view_model.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterView extends GetWidget<AuthViewModel> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterView({Key? key}) : super(key: key);

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
                    Get.back();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text:'Sign Up',
                        size: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 40),
                        child: CustomTextFormField(
                          initialValue: 'David Spade',
                          keyboardType: TextInputType.name,
                          text: 'Name',
                          onSaved: (String? newValue) {
                            controller.name=newValue!;
                          },
                          validator: (String? value) {
                            if(value==null)
                            {
                              print('null error');
                            }
                          },
                        ),
                      ),
                      CustomTextFormField(
                        initialValue: 'iamdavid@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        text: 'Email', validator: (String? value) {
                        if(value==null)
                        {
                          print('null error');
                        }
                      },
                        onSaved: (String? newValue) {
                          controller.email=newValue!;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 40,
                        ),
                        child: CustomTextFormField(
                          initialValue: 'facebook12',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          text: 'Email',
                          validator: (String? value) {
                            if(value==null)
                            {
                              print('null error');
                            }
                          },
                          onSaved: (String? newValue) {
                            controller.password=newValue!;
                          },
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          if(_formKey.currentState!.validate())
                          {
                            controller.signUpWithEmailAndPassword();
                          }
                        },
                        text: 'sign up'.toUpperCase(),
                        textSize: 18.0, width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
