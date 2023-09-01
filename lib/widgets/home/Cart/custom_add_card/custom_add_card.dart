import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';

class CustomAddCart extends StatelessWidget {
  final double price;
  final ProductModel productModels;
  CustomAddCart({
    required this.price,
    required this.productModels,
    Key? key,
  }) : super(key: key);
  final CartControllerImp cartControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25).r,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextLocal(text: "Price", color: mainColor, fontSize: 18.sp, fontWeight: FontWeight.bold),
              Text(
                "\$$price",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 20.h,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
           SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: SizedBox(
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary:  mainColor,
                ),
                onPressed: () {
                  cartControllerImp.addProductToCard(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextLocal(
                      text: "Add to Cart",
                      color:  Colors.white,
                      fontSize: 18.h,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
