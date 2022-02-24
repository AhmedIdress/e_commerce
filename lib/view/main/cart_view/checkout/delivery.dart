import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RadioListTile(activeColor: primaryColor,
                title:  CustomText(text: controller.deliveryType[0], size: 20,fontWeight: FontWeight.bold,),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomText(text: controller.deliveryDescribe[0], size: 14,maxLines: null,),
                  ),
                  value: DeliveryEnum.standard,
                  groupValue: controller.delivery,
                  onChanged: (DeliveryEnum? value) {
                    controller.deliveryChange(value);
                  }),
              RadioListTile(activeColor: primaryColor,
                title:  CustomText(text: controller.deliveryType[1], size: 20,fontWeight: FontWeight.bold,),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomText(text: controller.deliveryDescribe[1], size: 14,maxLines: null,),
                  ),
                  value: DeliveryEnum.nextDay,
                  groupValue: controller.delivery,
                  onChanged: (DeliveryEnum? value) {
                    controller.deliveryChange(value);
                  }),
              RadioListTile(activeColor: primaryColor,
                title:  CustomText(text: controller.deliveryType[2], size: 20,fontWeight: FontWeight.bold,),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomText(text: controller.deliveryDescribe[2], size: 14,maxLines: null,),
                  ),
                  value: DeliveryEnum.nominated,
                  groupValue: controller.delivery,
                  onChanged: (DeliveryEnum? value) {
                    controller.deliveryChange(value);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
