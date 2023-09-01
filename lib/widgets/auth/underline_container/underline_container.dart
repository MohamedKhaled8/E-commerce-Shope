import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';

class UnderStyleContainer extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

  const UnderStyleContainer({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black : mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextLocal(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            text: text,
            color: Colors.white,
            underLine: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: CustomTextLocal(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              text: textType,
              color: Colors.white,
              underLine: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
