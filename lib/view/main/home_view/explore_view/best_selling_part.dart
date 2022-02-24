import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/model/bestselling_model.dart';
import 'package:e_commerce/view/main/home_view/product_details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellingPart extends StatelessWidget {
  const BestSellingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder:(controller)=> Expanded(
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: 'Best Selling',
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    text: 'See all',
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: /*GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,

                  ),
                  itemBuilder: (context, index) {
                    return
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage('assets/images/Image.png'),
                              fit: BoxFit.fill,
                              height: 98,
                              width: MediaQuery.of(context).size.width*0.5,
                            ),
                            CustomText(text: 'BeoPlay Speaker', size: 16,fontWeight: FontWeight.bold,),
                            CustomText(text: 'Bang and Olufsen', size: 16,color: Colors.grey,),
                            CustomText(text: '\$755', size: 16,color: primaryColor,),
                          ],
                        ),
                      );
                  })*/ListView.separated(
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(ProductDetailsView(model: controller.bestsellingModel[ index],));
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(controller.bestsellingModel[index].image),
                              fit: BoxFit.cover,
                              height: 240,
                              width: 164,
                            ),
                            const SizedBox(height: 10,),
                            CustomText(text: controller.bestsellingModel[index].name, size: 16,fontWeight: FontWeight.bold,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5,),
                              child: CustomText(text: controller.bestsellingModel[index].describe, size: 16,color: Colors.grey,),
                            ),
                            CustomText(text: '\$${controller.bestsellingModel[index].price}', size: 16,color: primaryColor,),
                          ],
                        ),
                      ),
                    );
              }, separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                itemCount: controller.bestsellingModel.length,
              scrollDirection: Axis.horizontal,),
            ),
          ],
        ),
      ),
    );
  }
}
