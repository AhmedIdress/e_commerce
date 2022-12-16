import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/viewModel/track_order_view_model.dart';
import 'package:e_commerce/view/main/account_view/tack_order/order_process.dart';
import 'package:e_commerce/view/widgets/custom_appbar.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 16,
          right: 16,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * .2,
                  ),
                  child: const CustomText(text: 'Track Order', size: 25),
                ),
              ],
            ),
            SizedBox(height: size.height*.015,),
            Expanded(
              child: GetBuilder<TrackOrderViewModel>(
                init: TrackOrderViewModel(),
                builder: (controller) => ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.history[index].isNotEmpty?Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomText(
                          text: controller.history[index],
                          size: 18,color: Colors.grey,
                        ),
                      ):const SizedBox(),
                      GestureDetector(
                        onTap:(){
                          Get.to(OrderProcess(id: controller.content[index].id,state: controller.content[index].state,),
                              transition: Transition.zoom,
                              duration: const Duration(milliseconds: 300));
                        },
                        child: SizedBox(
                          height: size.height*.2,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                      Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: controller.content[index].id,
                                            size: 16,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 15.0),
                                            child: CustomText(
                                              text: controller.content[index].price,
                                              size: 16,
                                            ),
                                          ),
                                          Container(
                                            width: size.width * .3,
                                            height: size.height * .05,
                                            child: controller.content[index].orderState ==
                                                ProcessEnum.transit
                                                ? const Center(
                                              child: CustomText(
                                                text: 'In Transit',
                                                size: 16,
                                              ),
                                            )
                                                : const Center(
                                              child: CustomText(
                                                text: 'Delivered',
                                                size: 16,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: controller.content[index].orderState ==
                                                    ProcessEnum.transit
                                                    ? Colors.orange
                                                    : Colors.green),
                                          )
                                        ],
                                      ),
                                    ),
                                  Image(
                                    image: AssetImage(controller.content[index].image),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: size.height*.015,);
                },
                itemCount: controller.content.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
