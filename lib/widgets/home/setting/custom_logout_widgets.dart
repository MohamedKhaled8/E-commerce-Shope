import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/controller/auth/login/login_controller.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';

class CustomLogOutWidget extends StatelessWidget {
  CustomLogOutWidget({Key? key}) : super(key: key);

  final LoginControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "Logout From App".tr,
              titleStyle: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Are you sure you need to logout'.tr,
              middleTextStyle: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
              textCancel: " No ".tr,
              cancelTextColor: Colors.white,
              textConfirm: " YES ".tr,
              confirmTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: mainColor,
            );
          },
          splashColor: Get.isDarkMode ? mainColor : Colors.green[100],
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomTextLocal(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                text: "Logout".tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
