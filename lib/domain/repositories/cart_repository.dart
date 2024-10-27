import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/base/failure.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, Stream<List<CartEntity>>>> getCartData();
  Future<Either<Failure, Unit>> addProductToCart(ProductEntity product);
  Future<Either<Failure, Unit>> removeProductFromCart(CartEntity item);
  Future<Either<Failure, Unit>> removeAllProductFromCart();
  Future<Either<Failure, Unit>> changeAmountOfCart(CartEntity cart, int amount);
}
