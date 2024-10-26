import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/base/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> logIn({
    required String username,
    required String password,
  });

  Future<Either<Failure, String?>> getCurrentToken();
  Future<Either<Failure, Unit>> storeUserToken(String token);
}
