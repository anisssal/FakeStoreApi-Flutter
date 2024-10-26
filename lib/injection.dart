import 'package:dio/dio.dart';
import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart';
import 'package:flutter_fakestoreapi/core/utils/logger_interceptor.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/hive_auth_local_data_source_impl.dart';
import 'package:flutter_fakestoreapi/data/repository/auth_repository_impl.dart';
import 'package:flutter_fakestoreapi/domain/repositories/auth_repository.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final diContainer = GetIt.instance;

void setupDependencies()async {
  final dio = Dio();
  dio.interceptors.add(LoggerInterceptor());
  diContainer.registerSingleton<Dio>(dio);
  diContainer.registerSingleton(DioApiClient(dio: diContainer()));
  diContainer.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSource(dioApiClient: diContainer()));
  diContainer.registerSingleton<AuthLocalDataSource>(HiveAuthLocalDataSourceImpl(hiveInterface: Hive));
  diContainer.registerSingleton<AuthRepository>(AuthRepositoryImpl(remoteDataSource: diContainer(), localDataSource: diContainer()));

  diContainer.registerFactory<LoginCubit>(() => LoginCubit(authRepository: diContainer()));
  diContainer.registerFactory<AuthBloc>(() => AuthBloc(authRepository: diContainer()));

}
