import 'package:flutter_fakestoreapi/core/exceptions/api_exception.dart';
import 'package:flutter_fakestoreapi/core/utils/contants.dart';
import 'package:flutter_fakestoreapi/data/datasources/cart_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/hive_cart_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/hive_models/cart_hive_model.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_local_data_source_test.mocks.dart';

final cartHiveModels = [
  CartHiveModel(
      productId: 1,
      imgUrl: "https//:image.tes",
      title: "Product 1",
      price: 200,
      count: 90),
  CartHiveModel(
      productId: 3,
      imgUrl: "https//:image.tes3",
      title: "Product 3",
      price: 200,
      count: 90)
];

@GenerateMocks([HiveInterface, Box])
void main() {
  late HiveInterface hiveInterface;
  late CartLocalDataSource cartLocalDataSource;
  late MockBox<CartHiveModel> cartBox;

  setUp(() {
    hiveInterface = MockHiveInterface();
    cartLocalDataSource = HiveCartLocalDataSource(hiveInterface: hiveInterface);
    cartBox = MockBox<CartHiveModel>();
  });

  void setUpInitDbWithDummyData() {
    when(hiveInterface.openBox(Constants.cartBoxName))
        .thenAnswer((_) async => cartBox);
    when(hiveInterface.box(Constants.cartBoxName)).thenAnswer((_) => cartBox);
    when(cartBox.values).thenAnswer((_) => cartHiveModels);
  }

  void setUpInitDbWithError() {
    when(hiveInterface.openBox(Constants.cartBoxName))
        .thenAnswer((_) async => cartBox);
    when(hiveInterface.box(Constants.cartBoxName)).thenAnswer((_) => cartBox);
    when(cartBox.values).thenAnswer((_) => throw Exception());
  }

  group('''
    Perform initDB from local Data Source
  ''', () {
    test('''
        should initDB successfully
      ''', () async {
      setUpInitDbWithDummyData();
      await cartLocalDataSource.initDB();
      verify(hiveInterface.registerAdapter(CartHiveModelAdapter()));
      verify(hiveInterface.openBox(Constants.cartBoxName));
      verify(cartBox.values);
    });
  });

  group('''
    Perform getCartData from local Data Source
  ''', () {
    test('''
        should emits entities successfully
      ''', () async {
      setUpInitDbWithDummyData();
      await cartLocalDataSource.initDB();
      expect(cartLocalDataSource.getCartData(),
          emits(cartHiveModels.map((e) => e.toEntity())));
    });

    test('''
        should emits nothing if initDbFailed 
      ''', () async {
      setUpInitDbWithError();
      await cartLocalDataSource.initDB();
      expect(cartLocalDataSource.getCartData(), emits([]));
    });
  });

  group('''
    Perform addProductToCart from local Data Source
  ''', () {
    test('''
        should emits entities successfully ; initial-data-length=2
      ''', () async {
      const productEntity = ProductEntity(
        id: 2,
        image: "https//:image.tes",
        title: "Product 2",
        price: 300,
        category: "Men",
        description: "Men Product",
        raterCount: 90,
        rate: 5,
      );

      setUpInitDbWithDummyData();
      when(cartBox.add(CartHiveModel(
              productId: 2,
              imgUrl: "https//:image.tes",
              title: "Product 2",
              price: 300,
              count: 1)))
          .thenAnswer((_) async => 1);

      await cartLocalDataSource.initDB();
      await cartLocalDataSource.addProductToCart(productEntity);

      verify(cartBox.add(CartHiveModel(
          productId: 2,
          imgUrl: "https//:image.tes",
          title: "Product 2",
          price: 300,
          count: 1)));
      expect(
          cartLocalDataSource.getCartData(),
          emits([
            ...cartHiveModels.map((e) => e.toEntity()),
            const CartEntity(
                productId: 2,
                imgUrl: "https//:image.tes",
                title: "Product 2",
                price: 300,
                count: 1)
          ]));
    });

    test('''
        should emits entities successfully ; 
        adding an existing data will increase amount ; 
        initial-data-length=2 
      ''', () async {
      const productEntity = ProductEntity(
        title: "Product 3",
        price: 200,
        id: 3,
        image: "https//:image.tes3",
        category: "Men",
        description: "Men Product",
        raterCount: 90,
        rate: 5,
      );

      setUpInitDbWithDummyData();
      when(cartBox.add(CartHiveModel(
              productId: 3,
              imgUrl: "https//:image.tes3",
              title: "Product 3",
              price: 200,
              count: 91)))
          .thenAnswer((_) async => 1);

      when(cartBox.getAt(any)).thenAnswer((_) => CartHiveModel(
          productId: 3,
          imgUrl: "https//:image.tes3",
          title: "Product 3",
          price: 200,
          count: 90));

      await cartLocalDataSource.initDB();
      await cartLocalDataSource.addProductToCart(productEntity);

      verify(cartBox.add(CartHiveModel(
          productId: 3,
          imgUrl: "https//:image.tes3",
          title: "Product 3",
          price: 200,
          count: 91)));
      expect(
          cartLocalDataSource.getCartData(),
          emits([
            const CartEntity(
                productId: 1,
                imgUrl: "https//:image.tes",
                title: "Product 1",
                price: 200,
                count: 90),
            const CartEntity(
                productId: 3,
                imgUrl: "https//:image.tes3",
                title: "Product 3",
                price: 200,
                count: 91)
          ]));
    });

    test('''
        should throw UnknownException if exception happen
      ''', () async {
      const productEntity = ProductEntity(
        id: 2,
        image: "https//:image.tes",
        title: "Product 2",
        price: 300,
        category: "Men",
        description: "Men Product",
        raterCount: 90,
        rate: 5,
      );

      setUpInitDbWithDummyData();
      when(cartBox.add(CartHiveModel(
              productId: 2,
              imgUrl: "https//:image.tes",
              title: "Product 2",
              price: 300,
              count: 1)))
          .thenThrow(Exception());

      await cartLocalDataSource.initDB();

      expect(() => cartLocalDataSource.addProductToCart(productEntity),
          throwsA(const TypeMatcher<UnknownException>()));
    });
  });

  group('''
    Perform changeAmountOfCart from local Data Source
  ''', () {
    test('''
        should emits entities successfully ; 
        change existing cart with new amount ;
        initial amount = 90
        new amount = 5 
        initial-data-length=2 
      ''', () async {
      const newAmount = 5 ;
      const cartEntity = CartEntity(
          title: "Product 3",
          price: 200,
          productId: 3,
          imgUrl: "https//:image.tes3",
          count: 90);

      setUpInitDbWithDummyData();
      when(cartBox.putAt(
              any,
              CartHiveModel(
                  title: "Product 3",
                  price: 200,
                  productId: 3,
                  imgUrl: "https//:image.tes3",
                  count: newAmount)))
          .thenAnswer((_) async => 1);

      await cartLocalDataSource.initDB();
      await cartLocalDataSource.changeAmountOfCart(cartEntity, newAmount);

      verify(cartBox.putAt(any, CartHiveModel(
          title: "Product 3",
          price: 200,
          productId: 3,
          imgUrl: "https//:image.tes3",
          count: newAmount)));

      expect(
          cartLocalDataSource.getCartData(),
          emits([
            const CartEntity(
                productId: 1,
                imgUrl: "https//:image.tes",
                title: "Product 1",
                price: 200,
                count: 90),
            const CartEntity(
                productId: 3,
                imgUrl: "https//:image.tes3",
                title: "Product 3",
                price: 200,
                count: 5)
          ]));
    });

    test('''
        should throw UnknownException if exception happen
      ''', () async {
      const newAmount = 5 ;
      const cartEntity = CartEntity(
          title: "Product 3",
          price: 200,
          productId: 3,
          imgUrl: "https//:image.tes3",
          count: 90);

      setUpInitDbWithDummyData();
      when(cartBox.putAt(
          any,
          CartHiveModel(
              title: "Product 3",
              price: 200,
              productId: 3,
              imgUrl: "https//:image.tes3",
              count: newAmount)))
          .thenThrow(Exception());

      await cartLocalDataSource.initDB();

      expect(() => cartLocalDataSource.changeAmountOfCart(cartEntity, newAmount),
          throwsA(const TypeMatcher<UnknownException>()));
    });
  });

  group('''
    Perform removeProductFromCart local Data Source
  ''', () {
    test('''
        should delete selected entity 
      ''', () async {
      final selectedEntity = cartHiveModels.last.toEntity();

      setUpInitDbWithDummyData();
      when(cartBox.getAt(any)).thenAnswer((_) => CartHiveModel(
          productId: 3,
          imgUrl: "https//:image.tes3",
          title: "Product 3",
          price: 200,
          count: 90));
      when(cartBox.deleteAt(any)).thenAnswer((_) async => 1);

      await cartLocalDataSource.initDB();
      await cartLocalDataSource.removeProductFromCart(selectedEntity);

      verify(cartBox.deleteAt(any));
      expect(
          cartLocalDataSource.getCartData(),
          emits([
            const CartEntity(
                productId: 1,
                imgUrl: "https//:image.tes",
                title: "Product 1",
                price: 200,
                count: 90)
          ]));
    });

    test('''
       should throw UnknownException if exception happen
      ''', () async {
      final selectedEntity = cartHiveModels.last.toEntity();

      setUpInitDbWithDummyData();
      when(cartBox.deleteAt(any)).thenThrow(Exception());

      await cartLocalDataSource.initDB();
      expect(() => cartLocalDataSource.removeProductFromCart(selectedEntity),
          throwsA(const TypeMatcher<UnknownException>()));
    });
  });

  group('''
    Perform deleteAllRecentAirportSearch local Data Source
  ''', () {
    test('''
        should delete all data inside box 
      ''', () async {
      setUpInitDbWithDummyData();
      when(cartBox.clear()).thenAnswer((_) async => 1);

      await cartLocalDataSource.initDB();
      await cartLocalDataSource.removeAllProductFromCart();

      verify(cartBox.clear());
      expect(cartLocalDataSource.getCartData(), emits([]));
    });

    test('''
       should throw UnknownException if exception happen
      ''', () async {
      setUpInitDbWithDummyData();
      when(cartBox.clear()).thenThrow(Exception());

      await cartLocalDataSource.initDB();
      expect(() => cartLocalDataSource.removeAllProductFromCart(),
          throwsA(const TypeMatcher<UnknownException>()));
    });
  });
}
