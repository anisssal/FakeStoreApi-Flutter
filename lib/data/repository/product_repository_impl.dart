import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/base/failure.dart';
import 'package:flutter_fakestoreapi/core/exceptions/api_exception.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/data/datasources/product_remote_data_source.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_fakestoreapi/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteDataSource remoteDataSource ;

  ProductRepositoryImpl({required this.remoteDataSource,});


  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    try {
      final response = await remoteDataSource.getProducts();
      return right(response.map((e) => e.toEntity()).toList());
    } on NoInternetException {
      return left(const Failure.noInternetConnection());
    } catch (e) {
      logDebug.e(e.toString());
      return left(const Failure.unexpected());
    }

  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id)async {
    try {
      final response = await remoteDataSource.getProductById(id);
      if(response==null) return left(const Failure.unexpected());
      return right(response.toEntity());
    } on NoInternetException {
      return left(const Failure.noInternetConnection());
    } catch (e) {
      return left(const Failure.unexpected());
    }

  }




}