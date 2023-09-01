import 'package:get/get.dart';
import 'package:ecommerce/view/home_view/home_view.dart';
import '../../view/home_view/setting_view/setting_view.dart';
import '../../view/home_view/category_view/category_view.dart';
import 'package:ecommerce/view/home_view/favorite_view/favorite_view.dart';

abstract class MainController extends GetxController {}

class MainControllerImp extends MainController {
  RxInt currentIndex = 0.obs;

  var tabs = [
     HomeScreen(),
      CategoryScreen(),
     FavoritesScreen(),
     SettingsScreen(),
  ].obs;

  var nameScreens = [
    "HomeScreen".tr,
    "CategoryScreen".tr,
    "FavoritesScreen".tr,
    "SettingsScreen".tr,
  ].obs;
}
