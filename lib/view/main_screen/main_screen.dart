import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/widgets/bottomNavBar/bottom_nav_bar.dart';
import 'package:ecommerce/controller/main_controller/main_controller.dart';
import 'package:ecommerce/widgets/home/main_home/custom_badge_num_add_pro.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final MainControllerImp controller = Get.put(MainControllerImp());
  final CartControllerImp cartControllerImp = Get.put(CartControllerImp());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            controller.nameScreens[controller.currentIndex.value].tr,
            style: const TextStyle(color: Colors.white),
          ),
          leading: const SizedBox(),
          actions: [
            CustomBadgeNumberAddProduct(onPressed: () { 
               Get.toNamed(Routes.cartScreen);
             },),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigtionBar(),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs,
        ),
      );
    });
  }
}
