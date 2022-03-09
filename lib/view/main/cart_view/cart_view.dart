import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/cart_view_model.dart';
import 'package:e_commerce/view/main/cart_view/checkout/checkout_view.dart';
import 'package:e_commerce/view/widgets/bottom_bar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => !controller.loading.value
            ? Container(
                child: controller.cartProducts.isNotEmpty
                    ? Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.all(20),
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  onDismissed: (direction) {
                                    if (direction == DismissDirection.endToStart) {
                                      controller.removeProduct(controller
                                          .cartProducts[index].productId);
                                    }
                                    else{
                                      //to add in favorite list
                                      controller.refrichState();
                                    }
                                  },
                                  background: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    color: Colors.yellow,
                                    child: Row(
                                        textDirection: TextDirection.ltr,
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
                                        ]),
                                  ),
                                  secondaryBackground: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    color: Colors.red,
                                    child: Row(
                                        textDirection: TextDirection.rtl,
                                        children: const [
                                          Icon(Icons.delete,
                                              color: Colors.white),
                                        ]),
                                  ),
                                  key: UniqueKey(),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: NetworkImage(controller
                                            .cartProducts[index].image),
                                        fit: BoxFit.cover,
                                        height: size.height*.15,
                                        width: size.width*.33,
                                      ),
                                      SizedBox(
                                        width: size.width*.05,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          CustomText(
                                            text: controller
                                                .cartProducts[index].name,
                                            size: 16,
                                          ),
                                           SizedBox(
                                            height: size.height*.01,
                                          ),
                                          CustomText(
                                            text:
                                                '\$${controller.cartProducts[index].price}',
                                            size: 16,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: size.height*.03,
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
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(5),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                      )),
                                                ),
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                              ),
                                              Container(
                                                child: Center(
                                                    child: CustomText(
                                                  size: 15,
                                                  text: controller
                                                      .cartProducts[index]
                                                      .quantity
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
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topRight:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      )),
                                                ),
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: size.height*.02,
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
                              Get.to(const CheckoutView(),duration: const Duration(milliseconds: 1500),
                                transition: Transition.downToUp,
                                curve: Curves.bounceInOut,);
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/svg/undraw_empty_cart_co35.svg',
                              width: size.width*.7,
                              height: size.height*.34,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
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
