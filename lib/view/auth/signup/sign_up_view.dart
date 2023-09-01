import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/constant/my_string.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/auth/sign_in/custom_sign_in_check_box.dart';
import 'package:ecommerce/controller/auth/signup/sign_up_controller.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/widgets/custom_text_field/auth_text_form_field.dart';
import 'package:ecommerce/widgets/custom_buttom_local/custom_buttom_local.dart';
import 'package:ecommerce/widgets/auth/underline_container/underline_container.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final controller = Get.put(SignUpControllerImp());
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
                              text: 'SIGN  ',
                              underLine: TextDecoration.none,
                            ),
                            CustomTextLocal(
                              color: Colors.black,
                              fontSize: 33.sp,
                              fontWeight: FontWeight.normal,
                              text: 'UP ',
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                      ),
                      AuthTextFromField(
                        controller: controller.userNameUpController,
                        obscureText: false,
                        validator: (value) {
                          // ignore: unnecessary_null_comparison
                          if (controller.userNameUpController == null) {
                            return 'Please Enter User Name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30.h,
                              )
                            : Image.asset('assets/images/user.png'),
                        suffixIcon: const Text(""),
                        hintText: 'User Name',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      AuthTextFromField(
                        controller: controller.emailSignUpController,
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
                      GetBuilder<SignUpControllerImp>(
                        builder: (_) {
                          return AuthTextFromField(
                            controller: controller.passwordSignUpController,
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
                      GetBuilder<SignUpControllerImp>(builder: (_) {
                        return CustomSignUpCheckBox();
                      }),
                      SizedBox(
                        height: 40.h,
                      ),
                      GetBuilder<SignUpControllerImp>(builder: (_) {
                        return CustomButtomLocal(
                          onTap: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar(
                                "Check Box",
                                "Please, Accept terms & conditions",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            } else if (controller.fromKey.currentState!
                                .validate()) {
                              controller.signUpFirebase(
                                  name: controller.userNameUpController.text
                                      .trim(),
                                  email: controller.emailSignUpController.text
                                      .trim(),
                                  password:
                                      controller.passwordSignUpController.text);
                            }
                            controller.isCheckBox = true;
                          },
                          color: Get.isDarkMode ? Colors.black : mainColor,
                          height: 50.h,
                          width: 280.w,
                          text: 'SIGN UP',
                          fontSize: 20.sp,
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            UnderStyleContainer(
              text: "Already have an Account? ",
              textType: "Log in",
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
