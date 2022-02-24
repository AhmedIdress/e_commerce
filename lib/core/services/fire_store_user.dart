import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';

class FireStoreUser{
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');
  Future addUserToFireSore(UserModel userModel)async
  {
    return await users.doc(userModel.uid).set(userModel.toJson());
  }
  Future<UserModel> getUserFromFireSore(String uid)async
  {
    UserModel user;
    DocumentSnapshot doc = await users.doc(uid).get();
    user = UserModel.fromJson(doc.data() as Map<String,dynamic>);
    return user;
  }
}