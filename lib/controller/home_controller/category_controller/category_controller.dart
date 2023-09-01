import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/core/services/category_services/all_category_services.dart';

abstract class CategoryController extends GetxController {
  void getCategorys();
  getCategoryIndex(int index);
  getAllCategorys(String namecategory);
}

class CategoryControllerImp extends CategoryController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModel>[].obs;

  var isCatgeoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  @override
  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCatgeoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading(false);
    }
  }

  @override
  getAllCategorys(String namecategory) async {
    isAllCategory(true);

    categoryList.value =
        await AllCategorySercvises.getAllCategory(namecategory);
    isAllCategory(false);

    // var   categoryList.value =
    //       await AllCategorySercvises.getAllCategory(namecategory);
  }

  @override
  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);
    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
    //   var categoryAllName = await getAllCategorys(categoryNameList[index]);

    //   if (categoryAllName != null) {
    //     categoryList.value = categoryAllName;
    //   } 
    // }
  }
}
