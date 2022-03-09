import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/view/main/home_view/product_details_view.dart';
import 'package:e_commerce/view/main/home_view/see_all.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellingPart extends StatelessWidget {
  const BestSellingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Best Selling',
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              TextButton(
                onPressed: () {
                  Get.to(SeeAll());
                },
                child: const CustomText(
                  text: 'See all',
                  size: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .014,
          ),
          SizedBox(
            height: size.height * .45,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      ProductDetailsView(
                        model: controller.bestsellingModel[index],
                      ),
                      duration: const Duration(milliseconds: 1500),
                      transition: Transition.topLevel,
                      curve: Curves.bounceInOut,
                    );
                  },
                  child: SizedBox(
                    width: size.width * .4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(
                              controller.bestsellingModel[index].image),
                          fit: BoxFit.cover,
                          height: size.height * .32,
                          width: size.height * .4,
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        CustomText(
                          text: controller.bestsellingModel[index].name,
                          size: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * .005,
                          ),
                          child: CustomText(
                            text: controller.bestsellingModel[index].describe,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                        CustomText(
                          text: '\$${controller.bestsellingModel[index].price}',
                          size: 16,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: size.height * .01,
              ),
              itemCount: controller.bestsellingModel.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
