import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/view/main/cart_view/checkout/address.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);

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
                      left: size.width * .12,
                    ),
                    child: const CustomText(text: 'Shipping Address', size: 25),
                  ),
                ],
              ),
              SizedBox(height: size.height*.06,),
              controller.flag? Expanded(
                child: controller.addresses.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Column(
                              children: [
                                CustomText(
                                  text: controller.addresses[index]['street1']!+',' +
                                      controller.addresses[index]['street2']! +','+
                                      controller.addresses[index]['city']! +','+
                                      controller.addresses[index]['state']!+',' +
                                      controller.addresses[index]['country']!,
                                  size: 16,
                                  height: 1.5,
                                  maxLines: null,
                                ),
                              ],
                            ),
                            trailing: controller.activeAddress == index
                                ? const Icon(
                                    Icons.check_circle,
                                    color: primaryColor,
                                  )
                                : GestureDetector(
                                  child: const Icon(
                                      Icons.circle,
                                    ), onTap: () {
                                    controller.changeActiveAddress(index);
                            },
                                ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 30,);
                        },
                        itemCount: controller.addresses.length)
                    : const Center(child: Text('empty')),
              ):const Address(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
            right: 20,
            left: 200,
          ),
          child: CustomButton(
              text: controller.flag? 'new':'add', width: 180, textSize: 30, onPressed: () {
               if(controller.flag){controller.addNewAddress();}else{
                 controller.formState.currentState?.save();
                 if(controller.formState.currentState!.validate())
                   {
                     controller.addToList();
                     controller.addNewAddress();
                   }
               }
          }),
        ),
      ),
    );
  }
}
