import 'package:e_commerce/view/widgets/checkout_status.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderProcess extends StatelessWidget {
  const OrderProcess({Key? key,required this.id,required this.state}) : super(key: key);
  final String id;final int state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.only(
        top: 8.0,
        left: 16,
        right: 16,
        bottom: 10,
      ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                ),
                CustomText(text: id, size: 25),

              ],
            ),
            VerticalCheckoutState(currentState: state),
          ],
        ),
      ),
    );
  }
}
