import 'package:get/get.dart';
import 'package:ecommerce/controller/auth/login/login_controller.dart';
import 'package:ecommerce/controller/auth/signup/sign_up_controller.dart';
import 'package:ecommerce/controller/main_controller/main_controller.dart';
import 'package:ecommerce/controller/auth/forget_password/forget_passwod.dart';
import 'package:ecommerce/controller/home_controller/localization_controller/local.dart';
import 'package:ecommerce/controller/home_controller/cart_controller/cart_controller.dart';
import 'package:ecommerce/controller/home_controller/setting_controller/setting_controller.dart';
import 'package:ecommerce/controller/home_controller/category_controller/category_controller.dart';
import 'package:ecommerce/controller/home_controller/prouduct_controller/products_controller.dart';
import 'package:ecommerce/controller/home_controller/product_detailes_controller/product_detailes_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => MainControllerImp(), fenix: true);
    Get.lazyPut(() => ProductsControllerImp(), fenix: true);
    Get.lazyPut(() => CartControllerImp(), fenix: true);
    Get.lazyPut(() => ProductDetailesImp(), fenix: true);
    Get.lazyPut(() => CategoryControllerImp(), fenix: true);
    Get.lazyPut(() => SettingControllerImp(), fenix: true);
    Get.lazyPut(() => LoaclizationControllerImp(), fenix: true);
  }
}
