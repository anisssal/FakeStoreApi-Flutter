import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/base/failure.dart';
import 'package:flutter_fakestoreapi/data/datasources/cart_local_data_source.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_fakestoreapi/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository{
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});


  @override
  Future<Either<Failure, Stream<List<CartEntity>>>> getCartData() async{
    try{
      return right(localDataSource.getCartData());
    }catch(e){
      return left(const Failure.unexpected());
    }

  }
  @override
  Future<Either<Failure, Unit>> addProductToCart(ProductEntity product) async{
    try{
      return right(await localDataSource.addProductToCart(product));
    }catch(e){
      return left(const Failure.unexpected());
    }

  }

  @override
  Future<Either<Failure, Unit>> changeAmountOfCart(CartEntity cart,int amount) async{
    try{
      return right(await localDataSource.changeAmountOfCart(cart, amount));
    }catch(e){
    return left(const Failure.unexpected());
    }

  }

  @override
  Future<Either<Failure, Unit>> removeAllProductFromCart() async{
    try{
      return right(await localDataSource.removeAllProductFromCart());
    }catch(e){
    return left(const Failure.unexpected());
    }

  }

  @override
  Future<Either<Failure, Unit>> removeProductFromCart(CartEntity item)async {
    try{
      return right(await localDataSource.removeProductFromCart(item));
    }catch(e){
    return left(const Failure.unexpected());
    }

  }

}