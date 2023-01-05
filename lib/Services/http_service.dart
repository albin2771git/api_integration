import 'package:api_integration/Models/ProductModels.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<ProductsModel>> fetchProduct() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var data = response.body;
      return productsModelFromJson(data);
    } else {
      var data = response.body;
      return productsModelFromJson(data);
    }
  }
}
