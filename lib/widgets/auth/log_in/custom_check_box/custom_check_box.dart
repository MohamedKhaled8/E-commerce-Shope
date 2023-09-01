import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/auth/login/login_controller.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first



class CustomCheckBox extends StatelessWidget {
  final String text;
  CustomCheckBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  final LoginControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            controller.checkBox();
          },
          child: Container(
            height: 25.h,
            width: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100,
            ),
            child: controller.isCheckBox
                ? Image.asset(
                    "assets/images/check.png",
                  )
                : const SizedBox(),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        CustomTextLocal(
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            text: text,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underLine: TextDecoration.none),
      ],
    );
  }
}
