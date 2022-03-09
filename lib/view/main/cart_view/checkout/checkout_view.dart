import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/view/main/account_view/tack_order/track_order.dart';
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
    var size = MediaQuery.of(context).size;
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * .2,
                    ),
                    child: const CustomText(text: 'Checkout', size: 20),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .065,
              ),
              HorizontalCheckoutState(
                currentState: controller.currentState,
              ),
              SizedBox(
                height: size.height * .05,
              ),
              Expanded(
                  child: Transform.translate(
                offset: const Offset(1, 0),
                child: controller.currentWidget,filterQuality: FilterQuality.high,
              ))
              /*AnimatedContainer(transform: Matrix4.translation(translation),
                child: controller.currentWidget,
                duration: const Duration(
                  milliseconds: 1500,
                ),
              ),*/
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: controller.currentState != 0
                    ? OutlinedButton(
                        onPressed: () {
                          controller.stateChangePrevious();
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                          color: primaryColor,
                        )),
                        child: CustomText(
                          text: 'back'.toUpperCase(),
                          size: 18,
                        ),
                      )
                    : Container(),
              ),
              CustomButton(
                text: controller.currentState != 2 ? 'next' : 'Deliver',
                width: 150,
                textSize: 18,
                onPressed: () {
                  if (controller.currentState ==2) {
                    Get.offAll(const TrackOrder(),transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 1500));
                  }
                  else if (controller.currentState == 1) {
                    if (controller.formState.currentState!.validate()) {
                      controller.formState.currentState!.save();
                      controller.stateChangeNext();
                      return;
                    }
                  }else if (controller.currentState != 1) {
                    controller.stateChangeNext();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
