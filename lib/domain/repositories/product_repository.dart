import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/base/failure.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';

abstract class ProductRepository {

  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
}
