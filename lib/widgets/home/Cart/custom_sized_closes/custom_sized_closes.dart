import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/controller/home_controller/product_detailes_controller/product_detailes_controller.dart';

class CustomSizedCloses extends StatelessWidget {
  CustomSizedCloses({super.key});
  final ProductDetailesImp productDetailesImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10).w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GetBuilder<ProductDetailesImp>(builder: (_) {
            return InkWell(
              onTap: () {
                productDetailesImp.changeColorButtom(index);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10).w,
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? productDetailesImp.currentIndex == index
                          ? mainColor.withOpacity(0.4)
                          : Colors.black
                      : productDetailesImp.currentIndex == index
                          ? mainColor.withOpacity(0.4)
                          : Colors.white,
                  borderRadius: BorderRadius.circular(15).r,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2.w,
                  ),
                ),
                child: Text(
                  productDetailesImp.sizeList[index],
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? productDetailesImp.currentIndex == index
                            ? Colors.white
                            : Colors.white
                        : productDetailesImp.currentIndex == index
                            ? Colors.black
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          });
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        itemCount: productDetailesImp.sizeList.length,
      ),
    );
  }
}
