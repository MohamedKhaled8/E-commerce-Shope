import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/constant/my_string.dart';
import 'package:ecommerce/core/constant/theme_color.dart';
import 'package:ecommerce/core/language/loaclization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/view/splash_screen/splash_screen.dart';
import 'package:ecommerce/core/services/theme/themes_services.dart';
import 'package:ecommerce/controller/home_controller/localization_controller/local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemesApp.light,
        locale: Locale(GetStorage().read<String>('lang').toString()),
        translations: Translate(),
        fallbackLocale: Locale(ene),
        themeMode: ThemeServices().theme,
        darkTheme: ThemesApp.dark,
        title: 'Ecommerce-App',
        home: const SplashScreen(),
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('auth') == true
            ? AppRouters.mainSreen
            : AppRouters.welcome,
        getPages: AppRouters.routes,
        );
      },
    );
  }
}
