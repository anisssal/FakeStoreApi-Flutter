import 'package:equatable/equatable.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';

part 'cart_hive_model.g.dart';

@HiveType(typeId: 0)
class CartHiveModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final int count;

  CartHiveModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.count,
  });



  CartEntity toEntity() {
    return CartEntity(
        productId: productId, title: title, price: price, count: count);
  }

  static CartHiveModel fromEntity(CartEntity cartEntity) {
    return CartHiveModel(
        productId: cartEntity.productId,
        title: cartEntity.title,
        price: cartEntity.price,
        count: cartEntity.count);
  }

  static CartHiveModel fromProductEntity(ProductEntity product) {
    return CartHiveModel(
        productId: product.id,
        title: product.title,
        price: product.price,
        count: 1);
  }


  @override
  List<Object?> get props => [productId, title, price, count, title];

  CartHiveModel copyWith({
    int? productId,
    String? title,
    double? price,
    int? count,
  }) {
    return CartHiveModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }
}
