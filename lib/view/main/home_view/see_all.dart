import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/view/main/home_view/product_details_view.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(context: context),
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Padding(
                    padding: EdgeInsets.only(left: 75.0),
                    child: Center(
                      child: CustomText(
                        text: 'All products',
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: controller.bestsellingModel.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            ProductDetailsView(
                              model: controller.bestsellingModel[index],
                            ),
                            duration: const Duration(milliseconds: 300),
                            transition: Transition.topLevel,
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(
                                  controller.bestsellingModel[index].image),
                              fit: BoxFit.cover,
                              height: size.height * .3,
                              width: size.height * .4,
                            ),
                            CustomText(
                              text: controller.bestsellingModel[index].name,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: controller.bestsellingModel[index].describe,
                              size: 16,
                              color: Colors.grey,
                            ),
                            CustomText(
                              text: '\$' +
                                  controller.bestsellingModel[index].price,
                              size: 16,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
