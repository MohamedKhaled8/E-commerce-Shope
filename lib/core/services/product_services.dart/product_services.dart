import 'package:http/http.dart' as http;
import 'package:ecommerce/core/helper/end_point/end_point.dart';
import 'package:ecommerce/core/model/product_model/product_model.dart';

class ProductServices {
  Future<List<ProductModel>> getProudct() async {
    http.Response response = await http.get(Uri.parse(EndPoint.products));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
