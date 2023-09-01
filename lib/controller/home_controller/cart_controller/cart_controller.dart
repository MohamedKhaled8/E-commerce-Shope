import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class CartController extends GetxController {
  void addProductToCard(ProductModel productModel);
  void removeProductFromCard(ProductModel productModel);
  void removeOneProductFromCard(ProductModel productModel);
  void clearAllProductToCard();
  void isCompletPro();
  int quantity();
  void valueChange(double value);
  void isShowMoreText();
}

class CartControllerImp extends CartController {
  var productsMap = {}.obs;
  RxBool isAddProduct = false.obs;
  double value = 0;
  bool isShowMore = true;
    var rating = RxDouble(0.0);

  @override
  void isCompletPro() {
    isAddProduct.value = !isAddProduct.value;
  }

  @override
  void addProductToCard(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;
    } else {
      productsMap[productModel] = 1;
    }
  }

  @override
  void valueChange(double value) {
    value = value;
    update();
  }

  @override
  void clearAllProductToCard() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  @override
  void removeOneProductFromCard(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  @override
  void removeProductFromCard(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }
  }

  get subTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();
  get getTotal => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  @override
  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  @override
  void isShowMoreText() {
    isShowMore = !isShowMore;
    update();
  }
}
