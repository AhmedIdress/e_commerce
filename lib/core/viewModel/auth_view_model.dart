import 'package:e_commerce/core/services/fire_store_user.dart';
import 'package:e_commerce/helper/local_storage.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  late final String email, password;
  String? name;
  late Rx<User?> _user;
  String? get user => _user.value?.email;
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  @override
  void onInit() {
    super.onInit();
    _user = Rx<User?>(_firebaseAuth.currentUser);
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void googleSignIn() async {
    final GoogleSignInAccount? googleSignInAccountUser =
        await _googleSignIn.signIn();
    print(googleSignInAccountUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccountUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential).then((value) {
      addUserToFirestore(value);
      Get.offAll(const ControlView(),transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1500));
    });
  }

  void facebookSignIn() async {
    final LoginResult loginResult =
        await _facebookAuth.login(permissions: ['email']);
    final String accessToken = loginResult.accessToken!.token;
    final credential = FacebookAuthProvider.credential(accessToken);
    await _firebaseAuth.signInWithCredential(credential).then((value) {
      print(value);
      addUserToFirestore(value);
      Get.offAll( const ControlView(),transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1500));
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getUserFromFireSore(value.user!.uid).then((data) {
          setUser(data);
        });
      });
      Get.offAll(const ControlView(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1500));
    } catch (e) {
      Get.snackbar("error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        addUserToFirestore(value);
        Get.offAll( const ControlView(),transition: Transition.downToUp,
            duration: const Duration(milliseconds: 1500));
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar("error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void addUserToFirestore(UserCredential value) async {
    UserModel model = UserModel(
        uid: value.user!.uid,
        email: value.user!.email!,
        name: name ?? value.user!.displayName!,
        pic: '');
    await FireStoreUser().addUserToFireSore(model);
    setUser(model);
  }

  void setUser(UserModel userModel) async {
    await _localStorage.setUserData(userModel);
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }
}
