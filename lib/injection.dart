import 'package:dio/dio.dart';
import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart';
import 'package:flutter_fakestoreapi/core/utils/logger_interceptor.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/cart_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/hive_auth_local_data_source_impl.dart';
import 'package:flutter_fakestoreapi/data/datasources/hive_cart_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/product_remote_data_source.dart';
import 'package:flutter_fakestoreapi/data/repository/auth_repository_impl.dart';
import 'package:flutter_fakestoreapi/data/repository/cart_repository_impl.dart';
import 'package:flutter_fakestoreapi/data/repository/product_repository_impl.dart';
import 'package:flutter_fakestoreapi/domain/repositories/auth_repository.dart';
import 'package:flutter_fakestoreapi/domain/repositories/cart_repository.dart';
import 'package:flutter_fakestoreapi/domain/repositories/product_repository.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/login_cubit.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/bloc/product_detail_cubit.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final diContainer = GetIt.instance;

void setupDependencies() async {
  final dio = Dio();
  dio.interceptors.add(LoggerInterceptor());
  diContainer.registerSingleton<Dio>(dio);
  diContainer.registerSingleton(DioApiClient(dio: diContainer()));
  diContainer.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(dioApiClient: diContainer()));
  diContainer.registerSingleton<AuthLocalDataSource>(
      HiveAuthLocalDataSourceImpl(hiveInterface: Hive));
  diContainer.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      remoteDataSource: diContainer(), localDataSource: diContainer()));

  diContainer.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSource(dioApiClient: diContainer()));
  diContainer.registerSingleton<ProductRepository>(
      ProductRepositoryImpl(remoteDataSource: diContainer()));

  diContainer.registerSingleton<CartLocalDataSource>(
      HiveCartLocalDataSource(hiveInterface: Hive));
  diContainer.registerSingleton<CartRepository>(
      CartRepositoryImpl(localDataSource: diContainer()));

  diContainer.registerFactory<LoginCubit>(
      () => LoginCubit(authRepository: diContainer()));
  diContainer
      .registerFactory<AuthBloc>(() => AuthBloc(authRepository: diContainer()));
  diContainer.registerFactory<ProductsBloc>(
      () => ProductsBloc(productRepository: diContainer()));
  diContainer.registerFactory<ProductDetailCubit>(() => ProductDetailCubit(
      cartRepository: diContainer(), productRepository: diContainer()));
}
