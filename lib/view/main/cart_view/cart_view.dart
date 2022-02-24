import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/cart_view_model.dart';
import 'package:e_commerce/view/main/cart_view/checkout/checkout_view.dart';
import 'package:e_commerce/view/main/cart_view/checkout/delivery.dart';
import 'package:e_commerce/view/widgets/bottom_bar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => !controller.loading.value
            ?  Container(
                  child: controller.cartProducts.isNotEmpty
                      ? Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(20),
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        controller.cartProducts[index].image),
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: 120,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      CustomText(
                                        text: controller.cartProducts[index].name,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                        text:
                                            '\$${controller.cartProducts[index].price}',
                                        size: 16,
                                        color: primaryColor,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              child: const Center(
                                                  child: CustomText(
                                                size: 15,
                                                text: '+',
                                              )),
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                  )),
                                            ),
                                            onTap: () {
                                              controller.increaseQuantity(index);
                                            },
                                          ),
                                          Container(
                                            child: Center(
                                                child: CustomText(
                                              size: 15,
                                              text: controller
                                                  .cartProducts[index].quantity
                                                  .toString(),
                                            )),
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              child: const Center(
                                                  child: CustomText(
                                                size: 15,
                                                text: '-',
                                              )),
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topRight: Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  )),
                                            ),
                                            onTap: () {
                                              controller.decreaseQuantity(index);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: controller.cartProducts.length,
                          ),
                        ),
                        BottomBar(
                          upperPriceText: 'TOTAL',
                          buttonText: 'CHECKOUT',
                          price: '\$${controller.totalPrice}',
                          onPress: () {
                            Get.to(const CheckoutView());
                          },
                        ),
                      ],
                    ): SizedBox(
                    width: double.infinity,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg/undraw_empty_cart_co35.svg',width: 250,height: 250,),
                          const SizedBox(height: 25,),
                          const CustomText(text: 'Empty cart...', size: 18),
                        ],
                      ),
                    ),
                )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
