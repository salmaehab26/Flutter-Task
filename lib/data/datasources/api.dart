
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:route_task/data/models/productModel.dart';

class APImanager {

  static Future<ProductModel> getProduct() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}