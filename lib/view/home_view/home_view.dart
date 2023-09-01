import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/widgets/home/custom_card_items/custom_card_items.dart';
import 'package:ecommerce/widgets/custom_search_form_field/custom_search_form_field.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ProductsControllerImp productsControllerImp =
      Get.put(ProductsControllerImp());
final CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 190.h,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.white : mainColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50).w,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextLocal(
                        text: "Find Your".tr,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextLocal(
                        text: "Inspiration".tr,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                   SearchFormText(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomTextLocal(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    text: "Categories".tr,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CustomTextLocal(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    text: "See All".tr,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomCardItems(),
        ],
      ),
    );
  }
}
