import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150.h,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
           SizedBox(
            height: 40.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Cart is ",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 TextSpan(
                  text: "Empty",
                  style: TextStyle(
                    color:mainColor,
                    fontSize: 30.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            height: 10.h,
          ),
          Text(
            "Add items to get Started",
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
           SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 50.h,
            width: 280.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ), backgroundColor: mainColor,
                elevation: 0,
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child:  Text(
                'Go to Home',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}