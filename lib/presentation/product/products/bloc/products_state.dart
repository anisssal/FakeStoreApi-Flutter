part of 'products_bloc.dart';


enum ProductBlocStatus { initial, loading, failure, completed}
@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required ProductBlocStatus status ,
    required List<ProductEntity> products,
    required List<ProductEntity> originProducts,
    required String category ,
    required String searchQuery
})= _ProductsState;
}


