import 'package:dio/dio.dart';
import '../models/productModel.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        final List<dynamic> productList = response.data['products'];
        return productList.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Failed to load products: $error');
    }
  }
}
