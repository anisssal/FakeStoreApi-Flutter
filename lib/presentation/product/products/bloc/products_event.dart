part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.fetch() = _Fetch;
  const factory ProductsEvent.filterByCategory(String category) = _FilterByCategory;
  const factory ProductsEvent.searchByKeyword(String keyword) = ProductSearchKeywordChange;
}
