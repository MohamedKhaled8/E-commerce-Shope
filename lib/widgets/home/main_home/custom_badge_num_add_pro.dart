import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';

class CustomBadgeNumberAddProduct extends StatelessWidget {
  final Function()? onPressed;
  CustomBadgeNumberAddProduct({
    Key? key,
   required this.onPressed,
  }) : super(key: key);

  final CartControllerImp cartControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.fade(
          animationDuration: Duration(microseconds: 300)),
      badgeStyle: const badges.BadgeStyle(),
      badgeContent: Text(
        cartControllerImp.quantity().toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset('assets/images/shop.png' , color: Get.isDarkMode ? mainColor  : Colors.black, scale: 0.5,),
      ),
    );
    });
  }
}
