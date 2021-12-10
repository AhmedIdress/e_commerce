import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/auth/login_view/login_view.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.green,
      ),
      home: const LoginView(),
    );
  }
}

