import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FireStoreUser{
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future addUserToFireSore(UserModel userModel)async
  {
    return await users.doc(userModel.uid).set(userModel.toJson());
  }
}