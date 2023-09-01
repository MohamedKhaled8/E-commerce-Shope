import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle get subHedlineStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[400] : Colors.black,
  ));
}

TextStyle get hedlineStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get titleTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get subtitleText {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600],
  ));
}
