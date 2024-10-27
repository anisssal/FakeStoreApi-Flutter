part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.getCartItems() = _Started;
  const factory CartEvent.cartItemChanged(List<CartEntity> items) = _CartItemChanged;
  const factory CartEvent.deleteCartItem(CartEntity item) = _DeleteCartItem;
  const factory CartEvent.deleteAllItems() = _DeleteAllCartItems;
  const factory CartEvent.changeItemAmount(int amount, CartEntity cartEntity) = ChangeCartItemAmount;

}
