import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/view/main/home_view/explore_view/best_selling_part.dart';
import 'package:e_commerce/view/main/home_view/explore_view/categories.dart';
import 'package:e_commerce/view/main/home_view/product_details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : WillPopScope(
              onWillPop: () async{
                controller.searchState(false);
                return false;
              },
              child: Scaffold(
                body: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        top: 80, bottom: 14, right: 16, left: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              controller.searchOpration(value, context);
                            },
                            onTap: () {
                              controller.searchState(true);
                            },
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        !controller.search
                            ? Column(
                                children: const [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  CategoriesPart(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BestSellingPart(),
                                ],
                              )
                            : SizedBox(
                                height: size.height * .835,
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.5,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemCount: controller.searchList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          ProductDetailsView(
                                            model: controller.searchList[index],
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                controller.searchList[index].image),
                                            height: size.height * .32,
                                            width: size.height * .4,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: controller.searchList[index].name,
                                            size: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: size.height * .005,
                                            ),
                                            child: CustomText(
                                              text: controller
                                                  .searchList[index].describe,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          CustomText(
                                            text:
                                                '\$${controller.searchList[index].price}',
                                            size: 16,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                      ],
                    ),
                  ),
              ),
            ),
    );
  }
}
