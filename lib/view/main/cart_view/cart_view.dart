import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/bottom_bar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onHorizontalDragEnd: (dragEndDetail){},
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/Tag Heuer Wristwatch.png'),
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      CustomText(
                        text: 'Tag Heuer Wristwatch',
                        size: 16,
                      ),
                      const SizedBox(height: 5,),
                      CustomText(
                        text: '\$1100',
                        size: 16,
                        color: primaryColor,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Center(
                                  child: CustomText(
                                size: 15,
                                text: '+',
                              )),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  )),
                            ),
                          ),
                          Container(
                            child: Center(
                                child: CustomText(
                              size: 15,
                              text: '2',
                            )),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              child: Center(
                                  child: CustomText(
                                size: 15,
                                text: '-',
                              )),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 10,
        ),
      ),
      bottomNavigationBar: const BottomBar(
        upperPriceText: 'TOTAL',
        buttonText: 'CHECKOUT',
        price: '\$4500',
      ),
    );
  }
}
