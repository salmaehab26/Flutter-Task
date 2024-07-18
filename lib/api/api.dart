
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:route_task/api/product_response.dart';

class APImanager {

  static Future<ProductResponse> getProduct() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}