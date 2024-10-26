import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/base/failure.dart';
import 'package:flutter_fakestoreapi/core/exceptions/api_exception.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_fakestoreapi/domain/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource ;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.remoteDataSource,required this.localDataSource});

  @override
  Future<Either<Failure, String>> logIn({required String username, required String password}) async{
    try {
      final response = await remoteDataSource.userLogIn(username: username, password: password);
      localDataSource.storeUserToken(response);
      return right(response);
    } on NoInternetException {
      return left(const Failure.noInternetConnection());
    } catch (e) {
      return left(const Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, String?>> getCurrentToken() async{
    try {
      final token = await localDataSource.getUserToken();
      return right(token);
    }  catch (e) {
      return left(const Failure.unexpected());
    }

  }

  @override
  Future<Either<Failure, Unit>> storeUserToken(String token) async{
    try {
      await localDataSource.storeUserToken(token);
      return right(unit);
    }  catch (e) {
      return left(const Failure.unexpected());
    }

  }

}