import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:route_task/data/datasources/product_remote_data_source.dart';
import 'package:route_task/data/repositories/product_repository_impl.dart';
import 'package:route_task/domain/repositories/product_repository.dart';
import 'package:route_task/domain/usecases/get_products.dart';
import 'package:route_task/presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSource(dio: sl()));

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => GetProducts(sl()));

  sl.registerFactory(() => ProductCubit(getProducts: sl()));
}
