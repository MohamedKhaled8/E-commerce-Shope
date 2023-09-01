import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/widgets/home/Cart/custom_add_card/custom_add_card.dart';
import 'package:ecommerce/widgets/home/Cart/custom_produst_detailes/image_clider.dart';
import 'package:ecommerce/widgets/home/Cart/custom_sized_closes/custom_sized_closes.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
import 'package:ecommerce/widgets/home/Cart/closes_info_detailes/closes_info_detailes.dart';
import 'package:ecommerce/controller/home_controller/category_controller/category_controller.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';
import 'package:ecommerce/controller/home_controller/product_detailes_controller/product_detailes_controller.dart';


// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModels;

  ProductDetailsScreen({
    Key? key,
    required this.productModels,

  }) : super(key: key);
  final ProductDetailesImp productDetailesImp = Get.put(ProductDetailesImp());
  final CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  final ProductsControllerImp productsControllerImp =
      Get.put(ProductsControllerImp());
  final CategoryControllerImp categoryControllerImp =
      Get.put(CategoryControllerImp());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<ProductDetailesImp>(builder: (_) {
                return ImageSlidler(
                  imageUrl: productModels.image,
                );
              }),
              ClosesInfoDetailes(
                rate: productModels.rating.rate,
                descripthion: productModels.description,
                producteListId: productModels.id,
                title: productModels.title,
                productModels: productModels,
              ),
              CustomSizedCloses(),
              CustomAddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
