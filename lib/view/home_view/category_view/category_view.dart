import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/Category/custom_category_widget.dart';
import 'package:ecommerce/controller/home_controller/category_controller/category_controller.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});
final CategoryControllerImp categoryControllerImp = Get.put(CategoryControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15).r,
        child: Column(
          children: [
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Category',
                    textStyle: TextStyle(fontSize: 25.sp)),
              ],
              isRepeatingAnimation: true,
              onTap: () {},
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomCategoryWidget(),
          ],
        ),
      ),
    );
  }
}
