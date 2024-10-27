import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';

abstract class CartLocalDataSource {
  Future<void> initDB();
  Stream<List<CartEntity>> getCartData();
  Future<Unit> addProductToCart(ProductEntity product);
  Future<Unit> removeProductFromCart(CartEntity item);
  Future<Unit> removeAllProductFromCart();
  Future<Unit> changeAmountOfCart(CartEntity cart, int amount);



}