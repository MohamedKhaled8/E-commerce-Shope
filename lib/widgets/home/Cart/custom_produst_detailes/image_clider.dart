import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ecommerce/widgets/home/main_home/custom_badge_num_add_pro.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
import 'package:ecommerce/widgets/home/Cart/custom_produst_detailes/custom_color_pick.dart';
import 'package:ecommerce/controller/home_controller/product_detailes_controller/product_detailes_controller.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ImageSlidler extends StatelessWidget {
  final String imageUrl;
  ImageSlidler({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final ProductDetailesImp productDetailesImp = Get.find();
  final CartControllerImp cartControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10).r,
              decoration: BoxDecoration(
             
                image: DecorationImage(
                  image: NetworkImage(imageUrl ,),
                  fit: BoxFit.fill,
                  
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
          options: CarouselOptions(
            height: 350.h,
            
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              productDetailesImp.onPageChangedDetailes(index);
            },
          )),
      Positioned(
        bottom: 30.w,
        left: 180.w,
        child: AnimatedSmoothIndicator(
          activeIndex: productDetailesImp.currentPage,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: mainColor,
            dotColor: Colors.black,
          ),
        ),
      ),
      Positioned(
        bottom: 30.w,
        right: 30.w,
        child: Container(
          height: 200.h,
          width: 50.w,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  productDetailesImp.onPageChangedColors(index);
                },
                child: ColorPicker(
                  color: productDetailesImp.colorSelected[index],
                  outerBorder: productDetailesImp.currentColor == index,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 3.h),
            itemCount: productDetailesImp.colorSelected.length,
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ).r,
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(8).r,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10).w,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    size: 20.h,
                  ),
                ),
              ),
              
            ),
             CustomBadgeNumberAddProduct(
          onPressed: () {
            Get.toNamed(Routes.cartScreen);
          },
        ),
          ])),
    
    ]);
  }
}
