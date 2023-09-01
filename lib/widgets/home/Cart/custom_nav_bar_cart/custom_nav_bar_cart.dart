import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';

class CustomBottomBarCart extends StatelessWidget {
  CustomBottomBarCart({super.key});
  final CartControllerImp cartControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartControllerImp.productsMap.isEmpty) {
        return const SizedBox();
      } else { 
        return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.white : mainColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        height: 120.h,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextLocal(
                      text: "Total",
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.normal),
                  CustomTextLocal(
                      text: "\$ ${cartControllerImp.getTotal}",
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.normal),
                ],
              ),
              Container(
                height: 50.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: CustomTextLocal(
                        text: "Check Out",
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal)),
              )
            ],
          ));
      }
    });
  }
}
