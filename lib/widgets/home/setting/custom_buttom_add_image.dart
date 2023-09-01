import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/controller/home_controller/setting_controller/setting_controller.dart';

class CustomButtomAddImage extends StatelessWidget {
   CustomButtomAddImage({
    super.key,

  });

  final SettingControllerImp settingControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 5.w,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
          ),
          child: IconButton(
            onPressed: settingControllerImp.imagePickerOption,
            icon:  Icon(
              Icons.add_a_photo_outlined,
              color: Colors.black,
              size: 30.h,
            ),
          ),
        ));
  }
}