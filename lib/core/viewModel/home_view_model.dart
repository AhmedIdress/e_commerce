import 'package:e_commerce/core/services/home_services.dart';
import 'package:e_commerce/model/bestselling_model.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
BuildContext? context;
  final List<BestsellingModel> _bestsellingModel = [];
  List<BestsellingModel> get bestsellingModel => _bestsellingModel;
  late Map<String, List<BestsellingModel>> catigory = {
    'Men': [],
    'Women': [],
    'Gadgets': [],
    'Gaming': [],
    'Devices': [],
  };
  final List<BestsellingModel> _searchList = [];
  List<BestsellingModel> get searchList => _searchList;

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  bool search = false;

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
      catigoryClassifcation();
      update();
    });
  }

  void catigoryClassifcation() {
    _bestsellingModel.forEach((element) {
      catigory[element.catigory]?.add(element);
      update();
    });
  }

  void searchState(bool value) {
    search = value;
    update();
  }

  void searchOpration(String value, context) {
    bool flag = false;
    _searchList.clear();
    _bestsellingModel.forEach((element) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(element.name+','+element.name.toLowerCase().contains(value.toLowerCase()).toString())));

      if (element.name.toLowerCase().contains(value.toLowerCase()) == true) {
        _searchList.forEach((element2) {
          if (element.name == element2.name) {
            flag = true;
          }
        });
        if (!flag) {
          _searchList.add(element);
          flag = false;
        }
        update();
      }
    });
  }
}
