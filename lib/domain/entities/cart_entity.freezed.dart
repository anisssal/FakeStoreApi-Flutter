// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEntity {
  int get productId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartEntityCopyWith<CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEntityCopyWith<$Res> {
  factory $CartEntityCopyWith(
          CartEntity value, $Res Function(CartEntity) then) =
      _$CartEntityCopyWithImpl<$Res, CartEntity>;
  @useResult
  $Res call(
      {int productId, String title, double price, int count, String imgUrl});
}

/// @nodoc
class _$CartEntityCopyWithImpl<$Res, $Val extends CartEntity>
    implements $CartEntityCopyWith<$Res> {
  _$CartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? title = null,
    Object? price = null,
    Object? count = null,
    Object? imgUrl = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartEntityImplCopyWith<$Res>
    implements $CartEntityCopyWith<$Res> {
  factory _$$CartEntityImplCopyWith(
          _$CartEntityImpl value, $Res Function(_$CartEntityImpl) then) =
      __$$CartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productId, String title, double price, int count, String imgUrl});
}

/// @nodoc
class __$$CartEntityImplCopyWithImpl<$Res>
    extends _$CartEntityCopyWithImpl<$Res, _$CartEntityImpl>
    implements _$$CartEntityImplCopyWith<$Res> {
  __$$CartEntityImplCopyWithImpl(
      _$CartEntityImpl _value, $Res Function(_$CartEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? title = null,
    Object? price = null,
    Object? count = null,
    Object? imgUrl = null,
  }) {
    return _then(_$CartEntityImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartEntityImpl implements _CartEntity {
  const _$CartEntityImpl(
      {required this.productId,
      required this.title,
      required this.price,
      required this.count,
      required this.imgUrl});

  @override
  final int productId;
  @override
  final String title;
  @override
  final double price;
  @override
  final int count;
  @override
  final String imgUrl;

  @override
  String toString() {
    return 'CartEntity(productId: $productId, title: $title, price: $price, count: $count, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartEntityImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, title, price, count, imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      __$$CartEntityImplCopyWithImpl<_$CartEntityImpl>(this, _$identity);
}

abstract class _CartEntity implements CartEntity {
  const factory _CartEntity(
      {required final int productId,
      required final String title,
      required final double price,
      required final int count,
      required final String imgUrl}) = _$CartEntityImpl;

  @override
  int get productId;
  @override
  String get title;
  @override
  double get price;
  @override
  int get count;
  @override
  String get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
