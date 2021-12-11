import 'package:e_commerce/core/services/fire_store_user.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/main/main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  late final String email, password;
  late final String? name;
  late Rx<User?> _user;
  String? get user => _user.value?.email;

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
      Get.offAll(() => const MainView());
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
      Get.offAll(() => const MainView());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password); Get.offAll(() => const MainView());
    } catch (e) {
      Get.snackbar("error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        addUserToFirestore(value);
        Get.offAll(() => const MainView());
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar("error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void addUserToFirestore(UserCredential value) async {
    await FireStoreUser().addUserToFireSore(UserModel(
        uid: value.user?.uid,
        email: value.user?.email,
        name: name /*?? value.user!.displayName*/,
        pic: ''));
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }
}
