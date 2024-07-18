import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/presentation/cubit/product_state.dart';
import '../../domain/usecases/get_products.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;

  ProductCubit({required this.getProducts}) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await getProducts();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
