import 'package:e_commerce/constant.dart';
import 'package:e_commerce/helper/binding.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: primaryColor,
        ),
      ),
      home: const ControlView(),
    );
  }
}


