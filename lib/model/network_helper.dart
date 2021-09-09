import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/model/product.dart';

class NetworkHelper {
  List<Product> data = [];
  final uri = 'https://fakestoreapi.com/products';
  Future<List<Product>> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(uri));
      List<Product> products = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // print(data);

        for (var u in data) {
          products.add(Product.fromJson(u));
        }
        // print('ok 1');
        // print(products);
        return products;
      }
    } catch (e) {
      print(e.toString());
    }
    return data;
  }
}
