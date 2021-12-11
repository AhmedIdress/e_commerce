import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/view/main/home_view/category_result_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller)=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Categories',
            size: 18.0,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 100.0,
            child: ListView.separated(
              itemCount: controller.categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()=>Get.to(()=>const CategoryResultView()),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image(
                          image: NetworkImage(controller.categoryModel[index].image),
                        ),
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomText(text: controller.categoryModel[index].name, size: 14),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
