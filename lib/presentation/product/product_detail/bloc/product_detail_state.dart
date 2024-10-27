part of 'product_detail_cubit.dart';


enum ProductDetailCubitStatus { initial, successAddToCart, loading, completed, failure}
@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    required ProductDetailCubitStatus status,
    required ProductEntity? productEntity,
}) = _ProductDetailState;

}
