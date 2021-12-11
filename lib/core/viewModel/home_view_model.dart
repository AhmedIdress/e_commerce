import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection('Categories');
  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  HomeViewModel()
  {
    getCategory();
  }

  getCategory() async {
    _categoryCollectionReference.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(
            value.docs[i].data() as Map<String, dynamic>));
      }
    });
    update();
  }
}
