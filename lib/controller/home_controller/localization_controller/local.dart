import 'package:get_storage/get_storage.dart';
import 'package:ecommerce/core/constant/my_string.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class LoaclizationController extends GetxController {
  void saveLanguage(String lang);
  void changeLanguage(String typelang);
  Future<String?> get getLanguage;
}

class LoaclizationControllerImp extends LoaclizationController {
  var langLocal = ene;
  var storage = GetStorage();

  @override
  void onInit() async {
    langLocal = (await getLanguage);
    super.onInit();
  }

  @override
  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString("lang", lang);
  }

  @override
    Future<String> get getLanguage async {
    return await storage.read("lang");
  }

  @override
  void changeLanguage(String typelang) {
    saveLanguage(typelang);
    if (langLocal == typelang) {
      return;
    }

    if (typelang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typelang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
