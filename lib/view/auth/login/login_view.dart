import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/constant/my_string.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/auth/log_in/custom_image_auth.dart';
import 'package:ecommerce/controller/auth/login/login_controller.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/widgets/custom_text_field/auth_text_form_field.dart';
import 'package:ecommerce/widgets/custom_buttom_local/custom_buttom_local.dart';
import 'package:ecommerce/widgets/auth/underline_container/underline_container.dart';
import 'package:ecommerce/widgets/auth/log_in/custom_check_box/custom_check_box.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginControllerImp controller = Get.put(LoginControllerImp());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 40).r,
                child: Form(
                  key: controller.fromKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                        child: Row(
                          children: [
                            CustomTextLocal(
                              color: mainColor,
                              fontSize: 33.sp,
                              fontWeight: FontWeight.normal,
                              text: 'LOG ',
                              underLine: TextDecoration.none,
                            ),
                            CustomTextLocal(
                              color: Colors.black,
                              fontSize: 33.sp,
                              fontWeight: FontWeight.normal,
                              text: 'IN ',
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                      ),
                      AuthTextFromField(
                        controller: controller.emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30.h,
                              )
                            : Image.asset('assets/images/email.png'),
                        suffixIcon: const Text(""),
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: controller.passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30.h,
                                  )
                                : Image.asset('assets/images/lock.png'),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibilty
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextLocal(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          text: 'Forgot Password? ',
                          underLine: TextDecoration.none,
                          onTap: () {
                            Get.toNamed(Routes.forgotPasswordScreen);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GetBuilder<LoginControllerImp>(builder: (_) {
                        return CustomCheckBox(
                          text: "Remember me",
                        );
                      }),
                      SizedBox(
                        height: 30.h,
                      ),
                      GetBuilder<LoginControllerImp>(builder: (_) {
                        return CustomButtomLocal(
                          onTap: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar(
                                "Check Box",
                                "Remember me",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            } else if (controller.fromKey.currentState!
                                .validate()) {
                              controller.loginFirebase(
                                  email: controller.emailController.text.trim(),
                                  password: controller.passwordController.text);
                            }
                          },
                          color: Get.isDarkMode ? Colors.black : mainColor,
                          height: 50.h,
                          width: 280.w,
                          text: 'LOG IN',
                          fontSize: 20.sp,
                        );
                      }),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: CustomTextLocal(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          text: "-OR-",
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underLine: TextDecoration.none,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomImageAuth(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            UnderStyleContainer(
              text: "Don't have an Account? ",
              textType: "Sign up",
              onPressed: () {
                Get.offNamed(Routes.signUpScreen);
              },
            ),
          ],
        ),
      ),
    ));
  }
}