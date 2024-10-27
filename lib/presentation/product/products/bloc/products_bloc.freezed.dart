// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String keyword) searchByKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String keyword)? searchByKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filterByCategory,
    TResult Function(String keyword)? searchByKeyword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(ProductSearchKeywordChange value) searchByKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(ProductSearchKeywordChange value)? searchByKeyword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(ProductSearchKeywordChange value)? searchByKeyword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
          ProductsEvent value, $Res Function(ProductsEvent) then) =
      _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'ProductsEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String keyword) searchByKeyword,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String keyword)? searchByKeyword,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filterByCategory,
    TResult Function(String keyword)? searchByKeyword,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(ProductSearchKeywordChange value) searchByKeyword,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(ProductSearchKeywordChange value)? searchByKeyword,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(ProductSearchKeywordChange value)? searchByKeyword,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ProductsEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$FilterByCategoryImplCopyWith<$Res> {
  factory _$$FilterByCategoryImplCopyWith(_$FilterByCategoryImpl value,
          $Res Function(_$FilterByCategoryImpl) then) =
      __$$FilterByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$FilterByCategoryImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$FilterByCategoryImpl>
    implements _$$FilterByCategoryImplCopyWith<$Res> {
  __$$FilterByCategoryImplCopyWithImpl(_$FilterByCategoryImpl _value,
      $Res Function(_$FilterByCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$FilterByCategoryImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterByCategoryImpl implements _FilterByCategory {
  const _$FilterByCategoryImpl(this.category);

  @override
  final String category;

  @override
  String toString() {
    return 'ProductsEvent.filterByCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      __$$FilterByCategoryImplCopyWithImpl<_$FilterByCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String keyword) searchByKeyword,
  }) {
    return filterByCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String keyword)? searchByKeyword,
  }) {
    return filterByCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filterByCategory,
    TResult Function(String keyword)? searchByKeyword,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(ProductSearchKeywordChange value) searchByKeyword,
  }) {
    return filterByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(ProductSearchKeywordChange value)? searchByKeyword,
  }) {
    return filterByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(ProductSearchKeywordChange value)? searchByKeyword,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class _FilterByCategory implements ProductsEvent {
  const factory _FilterByCategory(final String category) =
      _$FilterByCategoryImpl;

  String get category;
  @JsonKey(ignore: true)
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductSearchKeywordChangeImplCopyWith<$Res> {
  factory _$$ProductSearchKeywordChangeImplCopyWith(
          _$ProductSearchKeywordChangeImpl value,
          $Res Function(_$ProductSearchKeywordChangeImpl) then) =
      __$$ProductSearchKeywordChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$ProductSearchKeywordChangeImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$ProductSearchKeywordChangeImpl>
    implements _$$ProductSearchKeywordChangeImplCopyWith<$Res> {
  __$$ProductSearchKeywordChangeImplCopyWithImpl(
      _$ProductSearchKeywordChangeImpl _value,
      $Res Function(_$ProductSearchKeywordChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$ProductSearchKeywordChangeImpl(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductSearchKeywordChangeImpl implements ProductSearchKeywordChange {
  const _$ProductSearchKeywordChangeImpl(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'ProductsEvent.searchByKeyword(keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSearchKeywordChangeImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSearchKeywordChangeImplCopyWith<_$ProductSearchKeywordChangeImpl>
      get copyWith => __$$ProductSearchKeywordChangeImplCopyWithImpl<
          _$ProductSearchKeywordChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filterByCategory,
    required TResult Function(String keyword) searchByKeyword,
  }) {
    return searchByKeyword(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filterByCategory,
    TResult? Function(String keyword)? searchByKeyword,
  }) {
    return searchByKeyword?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filterByCategory,
    TResult Function(String keyword)? searchByKeyword,
    required TResult orElse(),
  }) {
    if (searchByKeyword != null) {
      return searchByKeyword(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(ProductSearchKeywordChange value) searchByKeyword,
  }) {
    return searchByKeyword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(ProductSearchKeywordChange value)? searchByKeyword,
  }) {
    return searchByKeyword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(ProductSearchKeywordChange value)? searchByKeyword,
    required TResult orElse(),
  }) {
    if (searchByKeyword != null) {
      return searchByKeyword(this);
    }
    return orElse();
  }
}

abstract class ProductSearchKeywordChange implements ProductsEvent {
  const factory ProductSearchKeywordChange(final String keyword) =
      _$ProductSearchKeywordChangeImpl;

  String get keyword;
  @JsonKey(ignore: true)
  _$$ProductSearchKeywordChangeImplCopyWith<_$ProductSearchKeywordChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductsState {
  ProductBlocStatus get status => throw _privateConstructorUsedError;
  List<ProductEntity> get products => throw _privateConstructorUsedError;
  List<ProductEntity> get originProducts => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int get cartCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {ProductBlocStatus status,
      List<ProductEntity> products,
      List<ProductEntity> originProducts,
      String category,
      String searchQuery,
      int cartCount});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? products = null,
    Object? originProducts = null,
    Object? category = null,
    Object? searchQuery = null,
    Object? cartCount = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductBlocStatus,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      originProducts: null == originProducts
          ? _value.originProducts
          : originProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      cartCount: null == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductBlocStatus status,
      List<ProductEntity> products,
      List<ProductEntity> originProducts,
      String category,
      String searchQuery,
      int cartCount});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? products = null,
    Object? originProducts = null,
    Object? category = null,
    Object? searchQuery = null,
    Object? cartCount = null,
  }) {
    return _then(_$ProductsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductBlocStatus,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      originProducts: null == originProducts
          ? _value._originProducts
          : originProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      cartCount: null == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl implements _ProductsState {
  const _$ProductsStateImpl(
      {required this.status,
      required final List<ProductEntity> products,
      required final List<ProductEntity> originProducts,
      required this.category,
      required this.searchQuery,
      required this.cartCount})
      : _products = products,
        _originProducts = originProducts;

  @override
  final ProductBlocStatus status;
  final List<ProductEntity> _products;
  @override
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ProductEntity> _originProducts;
  @override
  List<ProductEntity> get originProducts {
    if (_originProducts is EqualUnmodifiableListView) return _originProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_originProducts);
  }

  @override
  final String category;
  @override
  final String searchQuery;
  @override
  final int cartCount;

  @override
  String toString() {
    return 'ProductsState(status: $status, products: $products, originProducts: $originProducts, category: $category, searchQuery: $searchQuery, cartCount: $cartCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._originProducts, _originProducts) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_originProducts),
      category,
      searchQuery,
      cartCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState(
      {required final ProductBlocStatus status,
      required final List<ProductEntity> products,
      required final List<ProductEntity> originProducts,
      required final String category,
      required final String searchQuery,
      required final int cartCount}) = _$ProductsStateImpl;

  @override
  ProductBlocStatus get status;
  @override
  List<ProductEntity> get products;
  @override
  List<ProductEntity> get originProducts;
  @override
  String get category;
  @override
  String get searchQuery;
  @override
  int get cartCount;
  @override
  @JsonKey(ignore: true)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
