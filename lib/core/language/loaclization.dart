import 'package:get/get.dart';
import 'package:ecommerce/core/language/ar.dart';
import 'package:ecommerce/core/language/fr.dart';
import 'package:ecommerce/core/language/en.dart';
import 'package:ecommerce/core/constant/my_string.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
