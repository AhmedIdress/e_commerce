import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices{
  final CollectionReference _categoryCollectionReference =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _bestsellingCollectionReference =
  FirebaseFirestore.instance.collection('Bestselling');

  Future<List<QueryDocumentSnapshot<Object?>>> getCategory()async
  {
    final value =await _categoryCollectionReference.get();
    return  value.docs;
  }
  Future<List<QueryDocumentSnapshot<Object?>>> getBestselling()async
  {
    final value =await _bestsellingCollectionReference.get();
    return  value.docs;
  }
}