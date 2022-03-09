import 'dart:convert';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/helper/database_helper.dart';
import 'package:e_commerce/helper/local_storage.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/view/main/cart_view/checkout/address.dart';
import 'package:e_commerce/view/main/cart_view/checkout/delivery.dart';
import 'package:e_commerce/view/main/cart_view/checkout/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int currentState = 0;
  int activeAddress = 0;
  bool flag = true;
  final List<Widget> _currentWidget = const [
    Delivery(),
    Address(),
    OrderSummary(),
  ];
  DeliveryEnum? _delivery = DeliveryEnum.standard;
  DeliveryEnum? get delivery => _delivery;
  List<CartModel> _data = [];
  List<CartModel> get data => _data;
  Widget get currentWidget => _currentWidget[currentState];
  List<String> deliveryType = [
    'Standard Delivery',
    'Next Day Delivery',
    'Nominated Delivery',
  ];
  List<String> deliveryDescribe = [
    'Order will be delivered between 3 - 5 business days',
    'Place your order before 6pm and your items will be delivered the next day',
    'Pick a particular date from the calendar and order will be delivered on selected date',
  ];
  GlobalKey<FormState>formState = GlobalKey<FormState>();
  Map<String,String> address={
    'street1':'',
    'street2':'',
    'city':'',
    'state':'',
    'country':'',
  };
  List<Map<String,String>> addresses=[];

  @override
  void onInit() {
    getSummaryData();
    getAddressList();
    super.onInit();
  }
  void addNewAddress()
  {
    flag=!flag;update();
  }
  void addToList()
  {
    LocalStorage localStorage = LocalStorage();
    addresses.add(address);
    List<String>? adData ;
    addresses.forEach((element) {
      adData?.add(jsonEncode(element));
    });
    localStorage.setAddressData(adData!);
    getAddressList();
  }
  void getAddressList()async
  {
    LocalStorage localStorage = LocalStorage();
    List<String>? adData =await localStorage.getAddressData();
    adData?.forEach((element) {
      addresses.add(jsonDecode(element));
    });
  }

  void changeActiveAddress( int index)
  {
    activeAddress=index;
    update();
  }

  void getSummaryData()async
  {
    await DatabaseHelper.db.getAllProducts().then((value) {
      _data=value;
      update();
    });
  }
  void stateChangeNext() {
    currentState++;
    update();
  }

  void stateChangePrevious() {
    currentState--;
    update();
  }
  void deliveryChange(DeliveryEnum? newDelivery)
  {
    _delivery=newDelivery;
    update();
  }
}
