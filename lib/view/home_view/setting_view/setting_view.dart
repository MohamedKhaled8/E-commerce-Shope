import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/controller/auth/login/login_controller.dart';
import 'package:ecommerce/widgets/home/setting/custom_ipload_image.dart';
import 'package:ecommerce/widgets/home/setting/custom_languge_widget.dart';
import 'package:ecommerce/widgets/home/setting/custom_logout_widgets.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/widgets/home/setting/custom_switch_dark_mode.dart';
import 'package:ecommerce/widgets/home/setting/custom_buttom_add_image.dart';
import 'package:ecommerce/controller/home_controller/localization_controller/local.dart';
import 'package:ecommerce/controller/home_controller/setting_controller/setting_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final SettingControllerImp settingControllerImp =
      Get.put(SettingControllerImp());
  final LoginControllerImp controller = Get.put(LoginControllerImp());
  final LoaclizationControllerImp loaclizationControllerImp = Get.put(LoaclizationControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  CustomUploadImahe(),
                  GetBuilder<SettingControllerImp>(builder: (_) {
                    return CustomButtomAddImage();
                  })
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(() {
              return Align(
                alignment: Alignment.center,
                child: CustomTextLocal(
                    text: controller.displayUserName.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(
              height: 10.h,
            ),
            Obx(() {
              return Align(
                alignment: Alignment.center,
                child: CustomTextLocal(
                    text: controller.displayUserEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              );
            }),
            Divider(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomTextLocal(
                  text: "General ",
                  color: mainColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSwitchDarkMode(),
             SizedBox(
              height: 20.h,
            ),
             CustomLanguageWidget(),
            SizedBox(
              height: 20.h,
            ),
            CustomLogOutWidget(),
          ],
        ),
      ),
    );
  }
}
