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
  final String imgUrl;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final int count;

  CartHiveModel({
    required this.productId,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.count,
  });



  CartEntity toEntity() {
    return CartEntity(
        productId: productId, title: title, price: price, count: count, imgUrl : imgUrl);
  }

  static CartHiveModel fromEntity(CartEntity cartEntity) {
    return CartHiveModel(
        productId: cartEntity.productId,
        title: cartEntity.title,
        price: cartEntity.price,
        imgUrl: cartEntity.imgUrl,
        count: cartEntity.count);
  }

  static CartHiveModel fromProductEntity(ProductEntity product) {
    return CartHiveModel(
        productId: product.id,
        imgUrl: product.image,
        title: product.title,
        price: product.price,
        count: 1);
  }


  @override
  List<Object?> get props => [productId, title, price, count, title,imgUrl];

  CartHiveModel copyWith({
    int? productId,
    String? title,
    String? imgUrl,
    double? price,
    int? count,
  }) {
    return CartHiveModel(
      productId: productId ?? this.productId,
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }
}
