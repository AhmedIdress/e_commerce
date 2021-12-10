import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController
{
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void googleSignIn () async
  {
    final GoogleSignInAccount? googleSignInAccountUser = await _googleSignIn.signIn();
    print(googleSignInAccountUser);
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccountUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }
}