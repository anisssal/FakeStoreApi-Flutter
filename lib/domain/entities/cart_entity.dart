import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_entity.freezed.dart';


@freezed
class CartEntity with _$CartEntity {
  const factory CartEntity({
    required int productId,
    required String title,
    required double price,
    required int count,
}) = _CartEntity;

}