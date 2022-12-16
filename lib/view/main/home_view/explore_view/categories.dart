import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/view/main/home_view/category_result_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Categories',
            size: 18.0,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: size.height * .025,
          ),
          SizedBox(
            height: size.height * .14,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(
                    CategoryResultView(catigory: controller.categoryModel[index].name,),
                    duration: const Duration(milliseconds: 300),
                    transition: Transition.zoom,
                    curve: Curves.bounceInOut,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image(
                          image: NetworkImage(
                              controller.categoryModel[index].image),
                        ),
                        radius: size.width * .08,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      CustomText(
                          text: controller.categoryModel[index].name, size: 14),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: size.height * .014,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
