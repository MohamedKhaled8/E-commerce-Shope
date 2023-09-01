import 'package:http/http.dart' as http;
import 'package:ecommerce/core/model/product_model/product_model.dart';
import 'package:ecommerce/core/model/category_mode/category_model.dart';

class AllCategorySercvises {
  static Future<List<ProductModel>> getAllCategory(String categoryNames) async {
    String baseUrl = 'https://fakestoreapi.com';
    http.Response response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
    // http.Response response =
    //     await http.get(Uri.parse('$EndPoint.categoryJewelery$categoryNames'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class CategoryServices {
  static Future<List<String>> getCategory() async {
    String baseUrl = 'https://fakestoreapi.com';

    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
