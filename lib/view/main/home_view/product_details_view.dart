import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/bottom_bar.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/Dri-FIT.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      const Spacer(),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.star_border_outlined,
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: 'Nike Dri-FIT Long Sleeve',
                    size: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            child: Text('size'),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text('medium'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('L'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('XL'),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text('2XL'),
                            value: 4,
                          ),
                        ],
                        onChanged: (value) {},
                        value: 1,
                        icon: const Text('size'),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      const Spacer(),
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            child: Text('size'),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text('medium'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('L'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('XL'),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text('2XL'),
                            value: 4,
                          ),
                        ],
                        onChanged: (value) {},
                        value: 1,
                        icon: const Text('size'),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Details',
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                        'Nike Dri-FIT is a polyester fabric designed to help you keep dry '
                        'so you can more comfortably work harder, longer.\nNike Dri-FIT is a polyester fabric '
                        'designed to help you keep dry so you can more comfortably work harder, longer.\n'
                        'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more '
                        'comfortably work harder, longer.',
                    size: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(
        price: '\$1500',
        upperPriceText: 'PRICE',
        buttonText: 'add',
      ),
    );
  }
}
