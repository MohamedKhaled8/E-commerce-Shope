import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/controller/home_controller/setting_controller/setting_controller.dart';

class CustomBuildIcons extends StatelessWidget {
   CustomBuildIcons({
    super.key,
  });
final SettingControllerImp settingControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
         SizedBox(
          width: 20.w,
        ),
        CustomTextLocal(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          text: "Dark Mode".tr,
          color:  Get.isDarkMode ? Colors.white : Colors.black ,
          underLine: TextDecoration.none,
        ),
      ],
    );
  }
}