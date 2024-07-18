import 'package:route_task/data/datasources/product_remote_data_source.dart';
import 'package:route_task/domain/repositories/product_repository.dart';

import '../../domain/product/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    final productModels = await remoteDataSource.fetchProducts();
    return productModels.map((model) => Product(
      id: model.id,
      title: model.title,
      description: model.description,
      price: model.price,
      thumbnail: model.thumbnail,
      rating: model.rating,
      discountPercentage: model.discountPercentage,
    )).toList();
  }
}
