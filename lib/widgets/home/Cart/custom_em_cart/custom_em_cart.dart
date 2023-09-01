import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/widgets/custom_text_local/custom_text_local.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


// ignore: must_be_immutable
class CartProductCard extends StatelessWidget {
  ProductModel productModel;
  final int index;
final int quantity;
  CartProductCard({
    Key? key,
    required this.productModel,
    required this.index,
    required this.quantity,
  }) : super(key: key);
  final CartControllerImp cartControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5).w,
      height: 110.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.white : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Radio(
            value: "",
            groupValue: "",
            onChanged: (val) {},
            activeColor: mainColor,
          ),
          Container(
            height: 100.h,
            width: 70.h,
            margin: const EdgeInsets.only(left: 15, top: 2).w,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      productModel.image,
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextLocal(
                      text: productModel.title,
                      color: Colors.black,
                      fontSize: 16.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal),
                  CustomTextLocal(
                      text: "\$ ${cartControllerImp.subTotal[index].toStringAsFixed(2)}",
                      color: Colors.black,
                      fontSize: 16.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal),
                ],
              )),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30).r,
                child: IconButton(
                  onPressed: () {
                    cartControllerImp.removeOneProductFromCard(productModel);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {
                          cartControllerImp.removeProductFromCard(productModel);
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomTextLocal(
                      text: "$quantity",
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.normal),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {
                          cartControllerImp.addProductToCard(productModel);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
