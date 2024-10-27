part of 'cart_bloc.dart';

enum CartBlocStatus { initial , loading, success, failure, }
@freezed
class CartState with _$CartState {
  const factory CartState({
    required CartBlocStatus status ,
    required CartBlocStatus changeAmountStatus ,
    required List<CartEntity> items ,
}) = _CartState;

}

extension CartStateX on CartState{
  int get totalItem  => items.length;
  double get totalPrice => items.fold(0, (previousValue, element) => previousValue + (element.price*element.count));
  int get totalItemQtyCount => items.fold(0, (previousValue, element) => previousValue+element.count);

}