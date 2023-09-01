import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = 'isDarkMode';
  // ignore: unused_element
  _saveThemesDb(bool isDarkMode) => _box.write(_key, isDarkMode);
  // ignore: unused_element
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changeThemes() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemesDb(!_loadThemeFromBox());
  }
}
