// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCartItems,
    required TResult Function(List<CartEntity> items) cartItemChanged,
    required TResult Function(CartEntity item) deleteCartItem,
    required TResult Function() deleteAllItems,
    required TResult Function(int amount, CartEntity cartEntity)
        changeItemAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCartItems,
    TResult? Function(List<CartEntity> items)? cartItemChanged,
    TResult? Function(CartEntity item)? deleteCartItem,
    TResult? Function()? deleteAllItems,
    TResult? Function(int amount, CartEntity cartEntity)? changeItemAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCartItems,
    TResult Function(List<CartEntity> items)? cartItemChanged,
    TResult Function(CartEntity item)? deleteCartItem,
    TResult Function()? deleteAllItems,
    TResult Function(int amount, CartEntity cartEntity)? changeItemAmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCartItems,
    required TResult Function(_CartItemChanged value) cartItemChanged,
    required TResult Function(_DeleteCartItem value) deleteCartItem,
    required TResult Function(_DeleteAllCartItems value) deleteAllItems,
    required TResult Function(ChangeCartItemAmount value) changeItemAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? getCartItems,
    TResult? Function(_CartItemChanged value)? cartItemChanged,
    TResult? Function(_DeleteCartItem value)? deleteCartItem,
    TResult? Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult? Function(ChangeCartItemAmount value)? changeItemAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCartItems,
    TResult Function(_CartItemChanged value)? cartItemChanged,
    TResult Function(_DeleteCartItem value)? deleteCartItem,
    TResult Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult Function(ChangeCartItemAmount value)? changeItemAmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CartEvent.getCartItems()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCartItems,
    required TResult Function(List<CartEntity> items) cartItemChanged,
    required TResult Function(CartEntity item) deleteCartItem,
    required TResult Function() deleteAllItems,
    required TResult Function(int amount, CartEntity cartEntity)
        changeItemAmount,
  }) {
    return getCartItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCartItems,
    TResult? Function(List<CartEntity> items)? cartItemChanged,
    TResult? Function(CartEntity item)? deleteCartItem,
    TResult? Function()? deleteAllItems,
    TResult? Function(int amount, CartEntity cartEntity)? changeItemAmount,
  }) {
    return getCartItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCartItems,
    TResult Function(List<CartEntity> items)? cartItemChanged,
    TResult Function(CartEntity item)? deleteCartItem,
    TResult Function()? deleteAllItems,
    TResult Function(int amount, CartEntity cartEntity)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (getCartItems != null) {
      return getCartItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCartItems,
    required TResult Function(_CartItemChanged value) cartItemChanged,
    required TResult Function(_DeleteCartItem value) deleteCartItem,
    required TResult Function(_DeleteAllCartItems value) deleteAllItems,
    required TResult Function(ChangeCartItemAmount value) changeItemAmount,
  }) {
    return getCartItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? getCartItems,
    TResult? Function(_CartItemChanged value)? cartItemChanged,
    TResult? Function(_DeleteCartItem value)? deleteCartItem,
    TResult? Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult? Function(ChangeCartItemAmount value)? changeItemAmount,
  }) {
    return getCartItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCartItems,
    TResult Function(_CartItemChanged value)? cartItemChanged,
    TResult Function(_DeleteCartItem value)? deleteCartItem,
    TResult Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult Function(ChangeCartItemAmount value)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (getCartItems != null) {
      return getCartItems(this);
    }
    return orElse();
  }
}

abstract class _Started implements CartEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CartItemChangedImplCopyWith<$Res> {
  factory _$$CartItemChangedImplCopyWith(_$CartItemChangedImpl value,
          $Res Function(_$CartItemChangedImpl) then) =
      __$$CartItemChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartEntity> items});
}

/// @nodoc
class __$$CartItemChangedImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$CartItemChangedImpl>
    implements _$$CartItemChangedImplCopyWith<$Res> {
  __$$CartItemChangedImplCopyWithImpl(
      _$CartItemChangedImpl _value, $Res Function(_$CartItemChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$CartItemChangedImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
    ));
  }
}

/// @nodoc

class _$CartItemChangedImpl implements _CartItemChanged {
  const _$CartItemChangedImpl(final List<CartEntity> items) : _items = items;

  final List<CartEntity> _items;
  @override
  List<CartEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartEvent.cartItemChanged(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemChangedImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemChangedImplCopyWith<_$CartItemChangedImpl> get copyWith =>
      __$$CartItemChangedImplCopyWithImpl<_$CartItemChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCartItems,
    required TResult Function(List<CartEntity> items) cartItemChanged,
    required TResult Function(CartEntity item) deleteCartItem,
    required TResult Function() deleteAllItems,
    required TResult Function(int amount, CartEntity cartEntity)
        changeItemAmount,
  }) {
    return cartItemChanged(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCartItems,
    TResult? Function(List<CartEntity> items)? cartItemChanged,
    TResult? Function(CartEntity item)? deleteCartItem,
    TResult? Function()? deleteAllItems,
    TResult? Function(int amount, CartEntity cartEntity)? changeItemAmount,
  }) {
    return cartItemChanged?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCartItems,
    TResult Function(List<CartEntity> items)? cartItemChanged,
    TResult Function(CartEntity item)? deleteCartItem,
    TResult Function()? deleteAllItems,
    TResult Function(int amount, CartEntity cartEntity)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (cartItemChanged != null) {
      return cartItemChanged(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCartItems,
    required TResult Function(_CartItemChanged value) cartItemChanged,
    required TResult Function(_DeleteCartItem value) deleteCartItem,
    required TResult Function(_DeleteAllCartItems value) deleteAllItems,
    required TResult Function(ChangeCartItemAmount value) changeItemAmount,
  }) {
    return cartItemChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? getCartItems,
    TResult? Function(_CartItemChanged value)? cartItemChanged,
    TResult? Function(_DeleteCartItem value)? deleteCartItem,
    TResult? Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult? Function(ChangeCartItemAmount value)? changeItemAmount,
  }) {
    return cartItemChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCartItems,
    TResult Function(_CartItemChanged value)? cartItemChanged,
    TResult Function(_DeleteCartItem value)? deleteCartItem,
    TResult Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult Function(ChangeCartItemAmount value)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (cartItemChanged != null) {
      return cartItemChanged(this);
    }
    return orElse();
  }
}

abstract class _CartItemChanged implements CartEvent {
  const factory _CartItemChanged(final List<CartEntity> items) =
      _$CartItemChangedImpl;

  List<CartEntity> get items;
  @JsonKey(ignore: true)
  _$$CartItemChangedImplCopyWith<_$CartItemChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCartItemImplCopyWith<$Res> {
  factory _$$DeleteCartItemImplCopyWith(_$DeleteCartItemImpl value,
          $Res Function(_$DeleteCartItemImpl) then) =
      __$$DeleteCartItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity item});

  $CartEntityCopyWith<$Res> get item;
}

/// @nodoc
class __$$DeleteCartItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$DeleteCartItemImpl>
    implements _$$DeleteCartItemImplCopyWith<$Res> {
  __$$DeleteCartItemImplCopyWithImpl(
      _$DeleteCartItemImpl _value, $Res Function(_$DeleteCartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$DeleteCartItemImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CartEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartEntityCopyWith<$Res> get item {
    return $CartEntityCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$DeleteCartItemImpl implements _DeleteCartItem {
  const _$DeleteCartItemImpl(this.item);

  @override
  final CartEntity item;

  @override
  String toString() {
    return 'CartEvent.deleteCartItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCartItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCartItemImplCopyWith<_$DeleteCartItemImpl> get copyWith =>
      __$$DeleteCartItemImplCopyWithImpl<_$DeleteCartItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCartItems,
    required TResult Function(List<CartEntity> items) cartItemChanged,
    required TResult Function(CartEntity item) deleteCartItem,
    required TResult Function() deleteAllItems,
    required TResult Function(int amount, CartEntity cartEntity)
        changeItemAmount,
  }) {
    return deleteCartItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCartItems,
    TResult? Function(List<CartEntity> items)? cartItemChanged,
    TResult? Function(CartEntity item)? deleteCartItem,
    TResult? Function()? deleteAllItems,
    TResult? Function(int amount, CartEntity cartEntity)? changeItemAmount,
  }) {
    return deleteCartItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCartItems,
    TResult Function(List<CartEntity> items)? cartItemChanged,
    TResult Function(CartEntity item)? deleteCartItem,
    TResult Function()? deleteAllItems,
    TResult Function(int amount, CartEntity cartEntity)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (deleteCartItem != null) {
      return deleteCartItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCartItems,
    required TResult Function(_CartItemChanged value) cartItemChanged,
    required TResult Function(_DeleteCartItem value) deleteCartItem,
    required TResult Function(_DeleteAllCartItems value) deleteAllItems,
    required TResult Function(ChangeCartItemAmount value) changeItemAmount,
  }) {
    return deleteCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? getCartItems,
    TResult? Function(_CartItemChanged value)? cartItemChanged,
    TResult? Function(_DeleteCartItem value)? deleteCartItem,
    TResult? Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult? Function(ChangeCartItemAmount value)? changeItemAmount,
  }) {
    return deleteCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCartItems,
    TResult Function(_CartItemChanged value)? cartItemChanged,
    TResult Function(_DeleteCartItem value)? deleteCartItem,
    TResult Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult Function(ChangeCartItemAmount value)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (deleteCartItem != null) {
      return deleteCartItem(this);
    }
    return orElse();
  }
}

abstract class _DeleteCartItem implements CartEvent {
  const factory _DeleteCartItem(final CartEntity item) = _$DeleteCartItemImpl;

  CartEntity get item;
  @JsonKey(ignore: true)
  _$$DeleteCartItemImplCopyWith<_$DeleteCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAllCartItemsImplCopyWith<$Res> {
  factory _$$DeleteAllCartItemsImplCopyWith(_$DeleteAllCartItemsImpl value,
          $Res Function(_$DeleteAllCartItemsImpl) then) =
      __$$DeleteAllCartItemsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAllCartItemsImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$DeleteAllCartItemsImpl>
    implements _$$DeleteAllCartItemsImplCopyWith<$Res> {
  __$$DeleteAllCartItemsImplCopyWithImpl(_$DeleteAllCartItemsImpl _value,
      $Res Function(_$DeleteAllCartItemsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteAllCartItemsImpl implements _DeleteAllCartItems {
  const _$DeleteAllCartItemsImpl();

  @override
  String toString() {
    return 'CartEvent.deleteAllItems()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteAllCartItemsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCartItems,
    required TResult Function(List<CartEntity> items) cartItemChanged,
    required TResult Function(CartEntity item) deleteCartItem,
    required TResult Function() deleteAllItems,
    required TResult Function(int amount, CartEntity cartEntity)
        changeItemAmount,
  }) {
    return deleteAllItems();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCartItems,
    TResult? Function(List<CartEntity> items)? cartItemChanged,
    TResult? Function(CartEntity item)? deleteCartItem,
    TResult? Function()? deleteAllItems,
    TResult? Function(int amount, CartEntity cartEntity)? changeItemAmount,
  }) {
    return deleteAllItems?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCartItems,
    TResult Function(List<CartEntity> items)? cartItemChanged,
    TResult Function(CartEntity item)? deleteCartItem,
    TResult Function()? deleteAllItems,
    TResult Function(int amount, CartEntity cartEntity)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (deleteAllItems != null) {
      return deleteAllItems();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCartItems,
    required TResult Function(_CartItemChanged value) cartItemChanged,
    required TResult Function(_DeleteCartItem value) deleteCartItem,
    required TResult Function(_DeleteAllCartItems value) deleteAllItems,
    required TResult Function(ChangeCartItemAmount value) changeItemAmount,
  }) {
    return deleteAllItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? getCartItems,
    TResult? Function(_CartItemChanged value)? cartItemChanged,
    TResult? Function(_DeleteCartItem value)? deleteCartItem,
    TResult? Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult? Function(ChangeCartItemAmount value)? changeItemAmount,
  }) {
    return deleteAllItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCartItems,
    TResult Function(_CartItemChanged value)? cartItemChanged,
    TResult Function(_DeleteCartItem value)? deleteCartItem,
    TResult Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult Function(ChangeCartItemAmount value)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (deleteAllItems != null) {
      return deleteAllItems(this);
    }
    return orElse();
  }
}

abstract class _DeleteAllCartItems implements CartEvent {
  const factory _DeleteAllCartItems() = _$DeleteAllCartItemsImpl;
}

/// @nodoc
abstract class _$$ChangeCartItemAmountImplCopyWith<$Res> {
  factory _$$ChangeCartItemAmountImplCopyWith(_$ChangeCartItemAmountImpl value,
          $Res Function(_$ChangeCartItemAmountImpl) then) =
      __$$ChangeCartItemAmountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int amount, CartEntity cartEntity});

  $CartEntityCopyWith<$Res> get cartEntity;
}

/// @nodoc
class __$$ChangeCartItemAmountImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ChangeCartItemAmountImpl>
    implements _$$ChangeCartItemAmountImplCopyWith<$Res> {
  __$$ChangeCartItemAmountImplCopyWithImpl(_$ChangeCartItemAmountImpl _value,
      $Res Function(_$ChangeCartItemAmountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? cartEntity = null,
  }) {
    return _then(_$ChangeCartItemAmountImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      null == cartEntity
          ? _value.cartEntity
          : cartEntity // ignore: cast_nullable_to_non_nullable
              as CartEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CartEntityCopyWith<$Res> get cartEntity {
    return $CartEntityCopyWith<$Res>(_value.cartEntity, (value) {
      return _then(_value.copyWith(cartEntity: value));
    });
  }
}

/// @nodoc

class _$ChangeCartItemAmountImpl implements ChangeCartItemAmount {
  const _$ChangeCartItemAmountImpl(this.amount, this.cartEntity);

  @override
  final int amount;
  @override
  final CartEntity cartEntity;

  @override
  String toString() {
    return 'CartEvent.changeItemAmount(amount: $amount, cartEntity: $cartEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCartItemAmountImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cartEntity, cartEntity) ||
                other.cartEntity == cartEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, cartEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCartItemAmountImplCopyWith<_$ChangeCartItemAmountImpl>
      get copyWith =>
          __$$ChangeCartItemAmountImplCopyWithImpl<_$ChangeCartItemAmountImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCartItems,
    required TResult Function(List<CartEntity> items) cartItemChanged,
    required TResult Function(CartEntity item) deleteCartItem,
    required TResult Function() deleteAllItems,
    required TResult Function(int amount, CartEntity cartEntity)
        changeItemAmount,
  }) {
    return changeItemAmount(amount, cartEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCartItems,
    TResult? Function(List<CartEntity> items)? cartItemChanged,
    TResult? Function(CartEntity item)? deleteCartItem,
    TResult? Function()? deleteAllItems,
    TResult? Function(int amount, CartEntity cartEntity)? changeItemAmount,
  }) {
    return changeItemAmount?.call(amount, cartEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCartItems,
    TResult Function(List<CartEntity> items)? cartItemChanged,
    TResult Function(CartEntity item)? deleteCartItem,
    TResult Function()? deleteAllItems,
    TResult Function(int amount, CartEntity cartEntity)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (changeItemAmount != null) {
      return changeItemAmount(amount, cartEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) getCartItems,
    required TResult Function(_CartItemChanged value) cartItemChanged,
    required TResult Function(_DeleteCartItem value) deleteCartItem,
    required TResult Function(_DeleteAllCartItems value) deleteAllItems,
    required TResult Function(ChangeCartItemAmount value) changeItemAmount,
  }) {
    return changeItemAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? getCartItems,
    TResult? Function(_CartItemChanged value)? cartItemChanged,
    TResult? Function(_DeleteCartItem value)? deleteCartItem,
    TResult? Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult? Function(ChangeCartItemAmount value)? changeItemAmount,
  }) {
    return changeItemAmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? getCartItems,
    TResult Function(_CartItemChanged value)? cartItemChanged,
    TResult Function(_DeleteCartItem value)? deleteCartItem,
    TResult Function(_DeleteAllCartItems value)? deleteAllItems,
    TResult Function(ChangeCartItemAmount value)? changeItemAmount,
    required TResult orElse(),
  }) {
    if (changeItemAmount != null) {
      return changeItemAmount(this);
    }
    return orElse();
  }
}

abstract class ChangeCartItemAmount implements CartEvent {
  const factory ChangeCartItemAmount(
          final int amount, final CartEntity cartEntity) =
      _$ChangeCartItemAmountImpl;

  int get amount;
  CartEntity get cartEntity;
  @JsonKey(ignore: true)
  _$$ChangeCartItemAmountImplCopyWith<_$ChangeCartItemAmountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  CartBlocStatus get status => throw _privateConstructorUsedError;
  CartBlocStatus get changeAmountStatus => throw _privateConstructorUsedError;
  List<CartEntity> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {CartBlocStatus status,
      CartBlocStatus changeAmountStatus,
      List<CartEntity> items});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? changeAmountStatus = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartBlocStatus,
      changeAmountStatus: null == changeAmountStatus
          ? _value.changeAmountStatus
          : changeAmountStatus // ignore: cast_nullable_to_non_nullable
              as CartBlocStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CartBlocStatus status,
      CartBlocStatus changeAmountStatus,
      List<CartEntity> items});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? changeAmountStatus = null,
    Object? items = null,
  }) {
    return _then(_$CartStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartBlocStatus,
      changeAmountStatus: null == changeAmountStatus
          ? _value.changeAmountStatus
          : changeAmountStatus // ignore: cast_nullable_to_non_nullable
              as CartBlocStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartEntity>,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {required this.status,
      required this.changeAmountStatus,
      required final List<CartEntity> items})
      : _items = items;

  @override
  final CartBlocStatus status;
  @override
  final CartBlocStatus changeAmountStatus;
  final List<CartEntity> _items;
  @override
  List<CartEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartState(status: $status, changeAmountStatus: $changeAmountStatus, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.changeAmountStatus, changeAmountStatus) ||
                other.changeAmountStatus == changeAmountStatus) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, changeAmountStatus,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {required final CartBlocStatus status,
      required final CartBlocStatus changeAmountStatus,
      required final List<CartEntity> items}) = _$CartStateImpl;

  @override
  CartBlocStatus get status;
  @override
  CartBlocStatus get changeAmountStatus;
  @override
  List<CartEntity> get items;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
