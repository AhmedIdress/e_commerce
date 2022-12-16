import 'package:e_commerce/core/viewModel/account_view_model.dart';
import 'package:e_commerce/view/main/account_view/shipping_address.dart';
import 'package:e_commerce/view/main/account_view/tack_order/track_order.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            left: 16,
            right: 16,
            bottom: 10,
          ),
          child: GetBuilder<AccountViewModel>(
            init: AccountViewModel(),
            builder: (controller) => Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          size.width * .166,
                        ),
                      ),
                      child: const Image(
                        image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/ecommerce-1cf19.appspot.com/o/e-commerce%2Fimages%2Fuser%2FAvatar.png?alt=media&token=d981a0ab-4313-471d-9c82-cd34a409ffae'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: controller.userModel?.name == null
                                ? ''
                                : controller.userModel!.name.toString(),
                            size: 26,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: size.height * .015,
                          ),
                          CustomText(
                            text: controller.userModel?.email == null
                                ? ''
                                : controller.userModel!.email.toString(),
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .135,
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.itemModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('edit profile')));
                            break;
                          case 1:
                            Get.to(const ShippingAddress(),transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 300));
                            break;
                          case 2:
                            Get.to(const TrackOrder(),transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 300));
                            break;
                          case 3:
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('cards')));
                            break;
                          case 4:
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('notification')));
                            break;
                          case 5:
                            controller.signOut();
                            break;
                        }
                      },
                      leading: Image(
                        image: AssetImage(
                          'assets/images/account/${controller.itemModel[index].image}',
                        ),
                      ),
                      title: CustomText(
                        text: controller.itemModel[index].title,
                        size: 18,
                      ),
                      trailing: index == 5
                          ? const SizedBox(
                              width: 1,
                              height: 1,
                            )
                          : const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: size.height * .015,
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
