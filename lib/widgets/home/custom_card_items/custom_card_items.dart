import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/view/home_view/cart/product_card_view.dart';
import 'package:ecommerce/widgets/home/Cart/build_card_items/build_card_items.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
import 'package:ecommerce/controller/home_controller/category_controller/category_controller.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';

class CustomCardItems extends StatelessWidget {
  CustomCardItems({super.key});
  final ProductsControllerImp productsControllerImp = Get.find();
  final CartControllerImp cartControllerImp = Get.find();
  final CategoryControllerImp categoryControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productsControllerImp.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        );
      } else {
        return Expanded(
          child: productsControllerImp.searchList.isEmpty &&
                  productsControllerImp.searchTextCont.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empry_light.png")
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 9.0,
                      childAspectRatio: 0.8),
                  itemBuilder: (BuildContext context, int index) {
                    if (productsControllerImp.searchList.isEmpty) {
                      return BuildCardItems(
                        image: productsControllerImp.producteList[index].image,
                        price: productsControllerImp.producteList[index].price,
                        rate: productsControllerImp
                            .producteList[index].rating.rate,
                        producteListId:
                            productsControllerImp.producteList[index].id,
                        productModel: productsControllerImp.producteList[index],
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(
                                productModels:
                                    productsControllerImp.producteList[index],
                            
                              ));
                        },
                      );
                    } else {
                      return BuildCardItems(
                        image: productsControllerImp.searchList[index].image,
                        price: productsControllerImp.searchList[index].price,
                        rate:
                            productsControllerImp.searchList[index].rating.rate,
                        producteListId:
                            productsControllerImp.searchList[index].id,
                        productModel: productsControllerImp.searchList[index],
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(
                                productModels:
                                    productsControllerImp.searchList[index],
                               
                              ));
                        },
                      );
                    }
                  },
                  itemCount: productsControllerImp.searchList.isEmpty
                      ? productsControllerImp.producteList.length
                      : productsControllerImp.searchList.length,
                ),
        );
      }
    });
  }
}
