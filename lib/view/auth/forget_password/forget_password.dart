import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_buttom_local/custom_buttom_local.dart';
import 'package:ecommerce/widgets/custom_text_field/auth_text_form_field.dart';
import 'package:ecommerce/controller/auth/forget_password/forget_passwod.dart';


class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.put(ForgetPasswordControllerImp());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,fontSize: 16.sp
                    ),
                  ),
                   SizedBox(
                    height: 50.h,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250.w,
                  ),
                   SizedBox(
                    height: 50.h,
                  ),
                  GetBuilder<ForgetPasswordControllerImp>(builder: (_) {
                    return AuthTextFromField(
                    controller: controller.emailForgetPasswordController,
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
                  }),
                   SizedBox(
                    height: 50.h,
                  ),
                  CustomButtomLocal(
                        color: Get.isDarkMode ? Colors.black : mainColor,
                        height: 50.h,
                        width: 280.w,
                        text: 'SEND',
                        fontSize: 20.sp,
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
