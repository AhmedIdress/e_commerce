import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Center(
        child: CustomText(
          text: 'Main View',
          size: 30.0,
        ),
      ),
    );
  }
}
