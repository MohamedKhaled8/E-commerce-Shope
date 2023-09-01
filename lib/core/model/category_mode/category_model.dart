import 'dart:convert';
// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

List<String> categoryModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoryModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
