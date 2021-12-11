import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/main/home_view/product_details_view.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryResultView extends StatelessWidget {
  const CategoryResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_ios)),
                Center(child: CustomText(text: 'Men', size: 20,),widthFactor: 6,),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,

                  ),
                  itemBuilder: (context, index) {
                    return
                      GestureDetector(
                        onTap: (){
                          Get.to(const ProductDetailsView());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage('assets/images/Dri-FIT.png'),
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
