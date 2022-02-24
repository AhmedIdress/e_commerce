import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/checkout_status.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Scaffold(
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
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 75,
                    ),
                    child: CustomText(text: 'Checkout', size: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              CheckoutStatus(
                currentState: controller.currentState,
              ),
              const SizedBox(height: 30,),
              controller.currentWidget,
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 150,height: 50,
                child: controller.currentState !=0? OutlinedButton(
                  onPressed: () {controller.stateChangePrevious();},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryColor,)
                  ),
                  child: CustomText(
                    text: 'back'.toUpperCase(),
                    size: 18,
                  ),
                ):Container(),
              ),
              CustomButton(
                text: controller.currentState !=2? 'next':'Deliver',
                width: 150,
                textSize: 18,
                onPressed: () {controller.stateChangeNext();},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
