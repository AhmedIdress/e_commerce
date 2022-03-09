import 'package:e_commerce/core/viewModel/cart_view_model.dart';
import 'package:e_commerce/helper/hex_color.dart';
import 'package:e_commerce/model/bestselling_model.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/view/widgets/bottom_bar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.model}) : super(key: key);
  final BestsellingModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(model.image),
                      height: 196,
                      width: double.infinity,
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
                        text: model.name,
                        size: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomText(
                                    text: 'Size',
                                    size: 18,
                                    color: Colors.grey.shade500),
                                const Spacer(),
                                const CustomText(
                                  text: 'XL',
                                  size: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomText(
                                    text: 'Color',
                                    size: 18,
                                    color: Colors.grey.shade500),
                                const Spacer(),
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: HexColor(model.color),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Details',
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: model.describe,
                        size: 16,
                        height: 1.75,
                        maxLines: null,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<CartViewModel>(
          builder: (controller) => BottomBar(
            buttonText: 'add',
            onPress: () {
              controller.addProduct(
                CartModel(
                  name: model.name,
                  image: model.image,
                  price: model.price,
                  productId: model.productId,
                ),
              );
              Get.back();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('product add to chart'),),);
            },
            upperPriceText: 'total',
            price: model.price,
          ),
        ));
  }
}
