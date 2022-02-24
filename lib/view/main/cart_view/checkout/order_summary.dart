import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      builder: (controller) => Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 176,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Image(
                          image: NetworkImage(controller.data[index].image),
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                        CustomText(
                          text: controller.data[index].name,
                          size: 18,
                        ),
                        CustomText(
                          text: '\$' + controller.data[index].price,
                          size: 14,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 15,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
