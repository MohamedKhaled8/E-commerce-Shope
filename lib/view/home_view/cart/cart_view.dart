import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/view/home_view/cart/custom_emp_card.dart';
import 'package:ecommerce/widgets/home/Cart/custom_em_cart/custom_em_cart.dart';
import 'package:ecommerce/widgets/home/Cart/custom_nav_bar_cart/custom_nav_bar_cart.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("Cart Items"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              cartControllerImp.clearAllProductToCard();
            },
            icon: const Icon(Icons.backspace),
          ),
        ],
      ),
      body: Obx(() {
        if (cartControllerImp.productsMap.isEmpty) {
          return const CustomEmptyCart();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600.h,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          productModel: cartControllerImp.productsMap.keys
                              .toList()[index],
                          index: index,
                          quantity: cartControllerImp.productsMap.values
                              .toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemCount: cartControllerImp.productsMap.length),
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar:  CustomBottomBarCart(),
    );
  }
}
