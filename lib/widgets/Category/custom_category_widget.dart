import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/widgets/Category/custom_category_items.dart';
import 'package:ecommerce/controller/home_controller/category_controller/category_controller.dart';

class CustomCategoryWidget extends StatelessWidget {
  CustomCategoryWidget({super.key});
  final CategoryControllerImp categoryControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryControllerImp.isCatgeoryLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      categoryControllerImp.getCategoryIndex(index);
                      Get.to(() => CategoryItems(
                            catehoryTitle:
                                categoryControllerImp.categoryNameList[index],
                          ));
                    },
                    child: Container(
                        height: 140.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                categoryControllerImp.imageCategory[index],
                              ),
                              fit: BoxFit.cover,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              categoryControllerImp.categoryNameList[index],
                              style: const TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: categoryControllerImp.categoryNameList.length));
      }
    });
  }
}
