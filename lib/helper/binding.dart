import 'package:e_commerce/core/viewModel/account_view_model.dart';
import 'package:e_commerce/core/viewModel/auth_view_model.dart';
import 'package:e_commerce/core/viewModel/cart_view_model.dart';
import 'package:e_commerce/core/viewModel/checkout_view_model.dart';
import 'package:e_commerce/core/viewModel/home_view_model.dart';
import 'package:e_commerce/core/viewModel/nav_main_view_model.dart';
import 'package:e_commerce/helper/local_storage.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => NavMainViewModel());
    Get.put(CartViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => LocalStorage());
    Get.lazyPut(() => AccountViewModel());
    Get.lazyPut(() => CheckoutViewModel());

  }

}
