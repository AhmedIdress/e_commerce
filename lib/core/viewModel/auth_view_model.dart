import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController
{
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

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

  void facebookSignIn() async
  {
    final LoginResult loginResult =  await _facebookAuth.login(permissions: ['email']);
    final String accessToken = loginResult.accessToken!.token;
    final credential = FacebookAuthProvider.credential(accessToken);
    await _firebaseAuth.signInWithCredential(credential);
  }
}