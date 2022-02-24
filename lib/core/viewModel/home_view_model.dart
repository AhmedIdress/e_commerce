import 'package:e_commerce/core/services/home_services.dart';
import 'package:e_commerce/helper/database_helper.dart';
import 'package:e_commerce/model/bestselling_model.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<BestsellingModel> _bestsellingModel = [];
  List<BestsellingModel> get bestsellingModel => _bestsellingModel;

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  HomeViewModel() {
    getCategory();
    getBestselling();
  }

  getCategory() async {
    _loading.value = true;
    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getBestselling() async {
    _loading.value = true;
    HomeServices().getBestselling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _bestsellingModel.add(
            BestsellingModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

}
