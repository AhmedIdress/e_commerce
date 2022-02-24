import 'package:e_commerce/core/viewModel/account_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
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
                    CircleAvatar(
                      radius: 60,
                      child: controller.userModel!.pic!.isEmpty?
                      const Image(image: AssetImage('assets/images/account/Avatar.png')) :
                      Image(image:NetworkImage(controller.userModel!.pic!),),),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          CustomText(
                            text: controller.userModel!.name!,
                            size: 26,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: controller.userModel!.email!,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                    child: ListView.separated(
                  itemCount: controller.itemModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        if(index==5)
                          {
                            controller.signOut();
                          }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${controller.userModel?.email} , ${controller.userModel?.name}')));
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
                    return const SizedBox(
                      height: 12,
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
