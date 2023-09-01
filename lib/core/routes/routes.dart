import 'package:get/get.dart';
import 'package:ecommerce/view/home_view/home_view.dart';
import 'package:ecommerce/view/auth/login/login_view.dart';
import '../../view/home_view/setting_view/setting_view.dart';
import 'package:ecommerce/view/main_screen/main_screen.dart';
import 'package:ecommerce/view/home_view/cart/cart_view.dart';
import 'package:ecommerce/view/auth/signup/sign_up_view.dart';
import '../../view/home_view/favorite_view/favorite_view.dart';
import 'package:ecommerce/view/splash_screen/splash_screen.dart';
import 'package:ecommerce/view/auth/forget_password/forget_password.dart';
import 'package:ecommerce/view/home_view/category_view/category_view.dart';

class AppRouters {
  //initialRoute
  static const welcome = Routes.splashScreen;
  static const mainSreen = Routes.mainScreen;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () =>  CategoryScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.favoritesScreen,
      page: () => FavoritesScreen(),
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () =>  SettingsScreen(),
    ),
    // GetPage(
    //   name: Routes.productToCardScreen,
    //   page: () =>  ProductToCardScreen(productModels: ProductModel[0],),
    // ),
  ];
}

class Routes {
  static const splashScreen = '/splashscreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const homeScreen = '/homeScreen';
  static const categoryScreen = '/categoryScreen';
  static const productToCardScreen = '/productToCardScreen';
  static const favoritesScreen = '/favoritesScreen';
  static const settingsScreen = '/settingsScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
