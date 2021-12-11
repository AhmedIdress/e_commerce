import 'package:e_commerce/core/viewModel/nav_main_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavMainViewModel>(
      init: NavMainViewModel(),
      builder: (controller){
        return Scaffold(
        body: controller.currentWidget ,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.newNavIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Image(
                image: AssetImage('assets/images/Icon_Explore.png'),
              ),
              label: '',
              activeIcon: CustomText(
                text: 'Explore\n     .',
                size: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            BottomNavigationBarItem(
              icon: const Image(
                image: AssetImage('assets/images/Icon_Cart.png'),
              ),
              label: '',
              activeIcon: CustomText(
                text: 'Cart\n   .',
                size: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            BottomNavigationBarItem(
              icon: const Image(
                image: AssetImage('assets/images/Icon_User.png'),
              ),
              label: '',
              activeIcon: CustomText(
                text: 'Account\n       .',
                size: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          onTap: (index){
            controller.navChange(index);
          },
        ),
      );},
    );
  }
}
