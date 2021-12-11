import 'package:e_commerce/core/viewModel/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_view/login_view.dart';
import 'package:e_commerce/view/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return
        controller.user == null?
        const LoginView():
        const MainView();
    });
  }

}
