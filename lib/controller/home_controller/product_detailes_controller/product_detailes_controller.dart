import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ProductDetailesController extends GetxController {
  void onPageChangedDetailes(int index);
  void onPageChangedColors(int index);
  void changeColorButtom(int index);
}

class ProductDetailesImp extends ProductDetailesController {
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor3,
    kCOlor4,
  ];
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  int currentIndex = 0;

  @override
  void onPageChangedDetailes(int index) {
    currentPage = index;
    update();
  }

  @override
  void onPageChangedColors(int index) {
    currentColor = index;
    update();
  }

  @override
  void changeColorButtom(int index) {
    currentIndex = index;
    update();
  }
}
