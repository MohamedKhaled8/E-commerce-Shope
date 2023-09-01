import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/routes/routes.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 190.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CustomTextLocal(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        text: 'Welcome'.tr,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextLocal(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          text: "Asroo".tr,
                          color: mainColor,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        CustomTextLocal(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          text: "Shop".tr,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ).w),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    child: CustomTextLocal(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      text: 'Get Start'.tr,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextLocal(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                        text: "Don't have an Account?".tr,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: CustomTextLocal(
                          text: 'Sign Up'.tr,
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          underLine: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
