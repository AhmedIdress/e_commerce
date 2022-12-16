import 'package:e_commerce/helper/local_storage.dart';
import 'package:e_commerce/model/account_item_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountViewModel extends GetxController{
  final List<AccountItemModel> _itemModel = [
    AccountItemModel('Edit Profile', 'Icon_Edit-Profile.png'),
    AccountItemModel('Shipping Address', 'Icon_Location.png'),
    AccountItemModel('Order History', 'Icon_History.png'),
    AccountItemModel('Cards', 'Icon_Payment.png'),
    AccountItemModel('Notifications', 'Icon_Alert.png'),
    AccountItemModel('Log Out', 'Icon_Exit.png'),
  ];
  List<AccountItemModel> get itemModel => _itemModel;
  UserModel? _userModel;
  UserModel? get userModel =>_userModel;
  final LocalStorage _localStorage = Get.find<LocalStorage>();
  @override
  void onInit(){
    super.onInit();
    getUser();
  }
  getUser()async
  {
    await _localStorage.getUserData().then((value) {
      _userModel=value;
    });
    update();
  }

  Future<void> signOut ()async{
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    await _localStorage.deleteUserData();
    Get.offAll( const ControlView(),transition: Transition.upToDown,
        duration: const Duration(milliseconds: 300));
  }

}