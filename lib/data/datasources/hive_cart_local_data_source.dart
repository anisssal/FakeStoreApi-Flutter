import 'package:dartz/dartz.dart';
import 'package:flutter_fakestoreapi/core/exceptions/api_exception.dart';
import 'package:flutter_fakestoreapi/core/utils/contants.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/data/datasources/cart_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/hive_models/cart_hive_model.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

class HiveCartLocalDataSource implements CartLocalDataSource {
  static const String tag = 'HiveCartLocalDataSource';

  final HiveInterface hiveInterface;

  HiveCartLocalDataSource({
    required this.hiveInterface,
  }){
    hiveInterface.registerAdapter(CartHiveModelAdapter());
  }

  late final _cartStreamCtrl = BehaviorSubject<List<CartEntity>>.seeded(
    const [],
  );

  @override
  Future<Unit> addProductToCart(ProductEntity product) async {
    final streamData = [..._cartStreamCtrl.value];
    var cartHiveModel = CartHiveModel.fromProductEntity(product);
    try {
      var box = await hiveInterface.openBox(Constants.cartBoxName);
      final hiveIndex = box.values.toList().indexWhere(
          (el) => (el as CartHiveModel).productId == cartHiveModel.productId);
      final currentHiveModel =
          hiveIndex != -1 ? box.getAt(hiveIndex) as CartHiveModel : null;
      if (currentHiveModel != null) {
        box.deleteAt(hiveIndex);
        streamData.remove(currentHiveModel.toEntity());
        cartHiveModel =
            cartHiveModel.copyWith(count: currentHiveModel.count + 1);
      }
      await box.add(cartHiveModel);
      streamData.add(cartHiveModel.toEntity());
      _cartStreamCtrl.add(streamData);
      logDebug.i('$tag addProductToCart');
      return Future.value(unit);
    } catch (e) {
      logDebug.i('$tag addProductToCart $e');
      throw UnknownException();
    }
  }

  @override
  Future<Unit> changeAmountOfCart(CartEntity cart) async {
    final streamData = [..._cartStreamCtrl.value];
    var cartHiveModel = CartHiveModel.fromEntity(cart);
    try {
      var box = await hiveInterface.openBox(Constants.cartBoxName);
      final hiveIndex = box.values.toList().indexWhere(
          (el) => (el as CartHiveModel).productId == cartHiveModel.productId);
      final currentHiveModel =
          hiveIndex != -1 ? box.getAt(hiveIndex) as CartHiveModel : null;
      if (currentHiveModel != null) {
        box.deleteAt(hiveIndex);
        streamData.remove(currentHiveModel.toEntity());
      }
      await box.add(cartHiveModel);
      streamData.add(cartHiveModel.toEntity());
      _cartStreamCtrl.add(streamData);
      logDebug.i('$tag changeAmountOfCart ');
      return Future.value(unit);
    } catch (e) {
      logDebug.e('$tag changeAmountOfCart', error: e);
      throw UnknownException();
    }
  }

  @override
  Stream<List<CartEntity>> getCartData() {
    _cartStreamCtrl.isEmpty.then((empty) async {
      if (empty) {
        try {
          var box = await hiveInterface.openBox(Constants.cartBoxName);
          var list =
              box.values.map((e) => (e as CartHiveModel).toEntity()).toList();
          _cartStreamCtrl.add(list);
          logDebug.i('$tag getCartData ');
        } catch (e) {
          logDebug.e('$tag getCartData', error: e);
        }
      }
    });

    return _cartStreamCtrl.stream;
  }

  @override
  Future<Unit> removeAllProductFromCart() async {
    try {
      var box = await hiveInterface.openBox(Constants.cartBoxName);
      box.clear();
      _cartStreamCtrl.add([]);
      logDebug.i('$tag removeAllProductFromCart ');
      return Future.value(unit);
    } catch (e) {
      logDebug.e('$tag removeAllProductFromCart', error: e);
      throw UnknownException();
    }
  }

  @override
  Future<Unit> removeProductFromCart(ProductEntity product) async {
    final streamData = [..._cartStreamCtrl.value];
    final cartHiveModel = CartHiveModel.fromProductEntity(product);
    try {
      var box = await hiveInterface.openBox(Constants.cartBoxName);
      final hiveIndex = box.values.toList().indexWhere(
          (el) => (el as CartHiveModel).productId == cartHiveModel.productId);
      if (hiveIndex != -1) {
        streamData.remove((box.getAt(hiveIndex) as CartHiveModel).toEntity());
        box.deleteAt(hiveIndex);
      }
      _cartStreamCtrl.add(streamData);
      logDebug.i('$tag removeAllProductFromCart ');
      return Future.value(unit);
    } catch (e) {
      logDebug.e('$tag removeAllProductFromCart', error: e);
      throw UnknownException();
    }
  }
}
