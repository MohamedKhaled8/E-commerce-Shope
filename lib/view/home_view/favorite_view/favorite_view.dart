import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/home/favorite/build_fav_items.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final ProductsControllerImp productsControllerImp =
      Get.put(ProductsControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        body: Obx(() {
          if (productsControllerImp.favoriteList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.h,
                    child: Image.asset(
                      "assets/images/heart.png",
                      color: Get.isDarkMode ? Colors.red : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextLocal(
                    text: "Please, Add your favorite proudcts",
                    color: Get.isDarkMode ? Colors.red : Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  )
                ],
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return BuildFavoriteItems(
                    image: productsControllerImp.favoriteList[index].image,
                    price: productsControllerImp.favoriteList[index].price,
                    title: productsControllerImp.favoriteList[index].title,
                    producteListId:
                        productsControllerImp.favoriteList[index].id,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemCount: productsControllerImp.favoriteList.length);
          }
        }));
  }
}


