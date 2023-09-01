import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/core/model/category_mode/category_Jewelery_model.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
import 'package:ecommerce/controller/home_controller/category_controller/category_controller.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


// ignore: must_be_immutable
class BuildCardItemsCategory extends StatelessWidget {
  final String image;
  final double price;
  final double rate;
  final int producteListId;
  CategoryProductModels categoryProductModels;
  ProductModel productModel;
  final Function()? onTap;
  BuildCardItemsCategory({
    Key? key,
    required this.image,
    required this.price,
    required this.rate,
    required this.producteListId,
    required this.categoryProductModels,
    required this.productModel,
    required this.onTap,
  }) : super(key: key);
final ProductsControllerImp productsControllerImp = Get.find();

final CartControllerImp cartControllerImp =Get.find();

  final CategoryControllerImp categoryControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7).w,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          productsControllerImp.mangeFavorite(producteListId);
                        },
                        icon: productsControllerImp.isFavoriteId(producteListId)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                              )),
                    IconButton(
                        onPressed: () {
                          cartControllerImp.addProductToCard(productModel);
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        )),
                  ],
                );
              }),
              Container(
                width: double.infinity,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextLocal(
                        text: "\$ $price",
                        color: mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        underLine: TextDecoration.none),
                    Container(
                      height: 25.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5).w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLocal(
                                text: "$rate",
                                color:
                                    Get.isDarkMode ? Colors.black : Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                underLine: TextDecoration.none),
                            Icon(
                              Icons.star,
                              size: 16.h,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
