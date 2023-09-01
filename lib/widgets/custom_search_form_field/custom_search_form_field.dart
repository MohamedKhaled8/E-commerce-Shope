import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({Key? key}) : super(key: key);


final ProductsControllerImp productsControllerImp =  Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsControllerImp>(builder: (_) {
      return TextField(
      controller: productsControllerImp.searchTextCont,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      onChanged: (searchName) {
        productsControllerImp.addSearchToList(searchName);
      },
      decoration: InputDecoration(
        fillColor: Get.isDarkMode ? Colors.black : Colors.white,
        focusColor: Get.isDarkMode ? Colors.black : Colors.white,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: 
        productsControllerImp.searchTextCont.text.isNotEmpty
            ? 
        IconButton(
                onPressed: () {
                  productsControllerImp.clearSearch();
                },
                icon:  Icon(
                  Icons.close,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              )
            : null,
        hintText: "Search with name & price".tr,
        hintStyle:  TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black,),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Get.isDarkMode ? Colors.white : Colors.black,),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    });
  }
}