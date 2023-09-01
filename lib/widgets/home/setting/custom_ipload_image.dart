import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/controller/home_controller/setting_controller/setting_controller.dart';

class CustomUploadImahe extends StatelessWidget {
  CustomUploadImahe({
    super.key,
  });

  final SettingControllerImp settingControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: GetBuilder<SettingControllerImp>(
              builder: (_) {
                return ClipOval(
                  child: settingControllerImp.pickedImage != null
                      ? Image.file(
                          settingControllerImp.pickedImage!,
                          width: 160.w,
                          height: 140.h,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://cdn.pixabay.com/photo/2016/01/03/00/43/upload-1118929_1280.png',
                          width: 180.w,
                          height: 170.h,
                          fit: BoxFit.cover,
                        ),
                );
              },
            )),
            
      ],
    );
  }
}
