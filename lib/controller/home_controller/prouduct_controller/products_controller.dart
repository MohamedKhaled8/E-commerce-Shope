import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/core/services/product_services.dart/product_services.dart';

abstract class ProductsController extends GetxController {
  void getProudcts();
  void addFavorite();
  void mangeFavorite(int producteListId);
  bool isFavoriteId(int producteListId);
  void addSearchToList(String searchName);
  void clearSearch();
}

class ProductsControllerImp extends ProductsController {
  var producteList = <ProductModel>[].obs;
  var favoriteList = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;
  var isLoading = true.obs;
  RxBool isFavorite = false.obs;
  final TextEditingController searchTextCont = TextEditingController();
  var getStorge = GetStorage();

  @override
  void addFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  @override
  void onInit() {
    // ignore: unused_local_variable
    List? storedShoppings = getStorge.read<List>("isFavoriteList");

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProudcts();
    super.onInit();
  }

  @override
  void getProudcts() async {
    var product = await ProductServices().getProudct();
    try {
      isLoading(true);
      if (product.isNotEmpty) {
        producteList.addAll(product);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void mangeFavorite(int producteListId) async {
    var indexWhere =
        favoriteList.indexWhere((element) => element.id == producteListId);
    if (indexWhere >= 0) {
      favoriteList.removeAt(indexWhere);
      await getStorge.remove("isFavoriteList");
    } else {
      favoriteList.add(
          producteList.firstWhere((element) => element.id == producteListId));
      await getStorge.write("isFavoriteList", favoriteList);
    }
  }

  @override
  bool isFavoriteId(int producteListId) {
    return favoriteList.any((element) => element.id == producteListId);
  }

  @override
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = producteList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  @override
  void clearSearch() {
    searchTextCont.clear();
    addSearchToList("");
  }
}
