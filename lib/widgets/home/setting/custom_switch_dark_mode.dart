import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/core/services/theme/themes_services.dart';
import 'package:ecommerce/widgets/home/setting/custom_build_icons.dart';
import 'package:ecommerce/controller/home_controller/setting_controller/setting_controller.dart';

class CustomSwitchDarkMode extends StatelessWidget {
   CustomSwitchDarkMode({super.key});
final SettingControllerImp settingControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          CustomBuildIcons(),
        Switch(
            activeTrackColor:  mainColor,
            activeColor:  mainColor,
            value: settingControllerImp.swithchValue.value,
            onChanged: (value) {
              settingControllerImp.swithchValue.value = value;
              ThemeServices().changeThemes();
            })
      ],
    );
    });
  }
}


