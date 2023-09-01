import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/controller/main_controller/main_controller.dart';

class CustomBottomNavigtionBar extends StatelessWidget {
  CustomBottomNavigtionBar({
    super.key,
  });

  final MainControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      currentIndex: controller.currentIndex.value,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            color: Get.isDarkMode ? mainColor : mainColor,
          ),
          icon: Icon(
            Icons.home,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.category,
            color: Get.isDarkMode ? mainColor : mainColor,
          ),
          icon: Icon(
            Icons.category,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.favorite,
            color: Get.isDarkMode ? mainColor : mainColor,
          ),
          icon: Icon(
            Icons.favorite,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.settings,
            color: Get.isDarkMode ? mainColor : mainColor,
          ),
          icon: Icon(
            Icons.settings,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          label: '',
        ),
      ],
      onTap: (index) {
        controller.currentIndex.value = index;
      },
    );
  }
}
