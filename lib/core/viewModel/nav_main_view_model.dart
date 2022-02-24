import 'package:e_commerce/view/main/account_view/account_view.dart';
import 'package:e_commerce/view/main/cart_view/cart_view.dart';
import 'package:e_commerce/view/main/home_view/explore_view/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavMainViewModel extends GetxController
{
  int _currentIndex =0;
  int get newNavIndex => _currentIndex;
  Widget get currentWidget => _currentView[_currentIndex];
  final List<Widget> _currentView = const[
     ExploreView(),
     CartView(),
     AccountView(),
  ];
  void navChange(int newIndex)
  {
    _currentIndex = newIndex;
    update();
  }
}