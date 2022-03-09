import 'package:e_commerce/helper/database_helper.dart';
import 'package:e_commerce/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  List<CartModel> _cartProducts = [];

  List<CartModel> get cartProducts => _cartProducts;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading=>_loading;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
  }

  getCartProducts() async {
    _loading.value=true;
    _cartProducts = await DatabaseHelper.db.getAllProducts();
    getTotalPrice();
    _loading.value=false;
    update();
  }

  addProduct(CartModel cartModel) async {
    bool _isExist = false;
    _cartProducts.forEach((element) {
      if (element.productId == cartModel.productId) {
        _isExist = true;
      }
    });
    if (!_isExist) {
      await DatabaseHelper.db.insertProduct(cartModel);
      getCartProducts();
    }
  }

  removeProduct(String productId) async {
    await DatabaseHelper.db.deleteProduct(productId);
    getCartProducts();
  }

  removeAllProducts() async {
    await DatabaseHelper.db.deleteAllProducts();
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    _cartProducts.forEach((cartProduct) {
      _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    });
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    getTotalPrice();
    await DatabaseHelper.db.update(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity > 1) {
      _cartProducts[index].quantity--;
      getTotalPrice();
      await DatabaseHelper.db.update(_cartProducts[index]);
      update();
    }
  }
  void refrichState()
  {
    update();
  }
}