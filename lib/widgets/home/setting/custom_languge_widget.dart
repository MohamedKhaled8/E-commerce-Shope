import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ecommerce/core/constant/my_string.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/controller/home_controller/localization_controller/local.dart';

class CustomLanguageWidget extends StatelessWidget {
  CustomLanguageWidget({super.key});
  final LoaclizationControllerImp loaclizationControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaclizationControllerImp>(builder: (_) {
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: languageSettings,
            ),
            child: const Icon(
              Icons.language,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          CustomTextLocal(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "Language".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              width: 150.w,
              height: 40.h,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2).w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 25.h,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: ene,
                      child: CustomTextLocal(
                          text: english,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownMenuItem(
                      value: ara,
                      child: CustomTextLocal(
                          text: arabic,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownMenuItem(
                      value: frf,
                      child: CustomTextLocal(
                          text: france,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  value: loaclizationControllerImp.langLocal,
                  onChanged: (value) {
                    loaclizationControllerImp.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                     loaclizationControllerImp.langLocal = value;
                  },
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
