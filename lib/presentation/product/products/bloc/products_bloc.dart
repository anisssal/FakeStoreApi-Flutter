import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_fakestoreapi/domain/repositories/cart_repository.dart';
import 'package:flutter_fakestoreapi/domain/repositories/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

const _debounceDuration = Duration(milliseconds: 300);

EventTransformer<Event> debounceTransformer<Event>() {
  return (events, mapper) {
    return events.debounceTime(_debounceDuration).asyncExpand(mapper);
  };
}

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
  final CartRepository cartRepository;

  ProductsBloc({required this.productRepository, required this.cartRepository})
      : super(const ProductsState(
          status: ProductBlocStatus.initial,
          products: [],
          originProducts: [],
          category: '',
          searchQuery: '',
          cartCount: 0,
        )) {
    on<ProductsEvent>((events, emit) async {
      await events.map(
          fetch: (event) async {
            await _fetchProducts(emit);
          },
          filterByCategory: (event) async {
            await _filterProduct(
              emit,
              category: event.category,
              searchQuery: state.searchQuery,
            );
          },
          searchByKeyword: (_) {});
    });

    on<ProductSearchKeywordChange>((events, emit) {
      events.map(
        fetch: (_) {},
        filterByCategory: (_) {},
        searchByKeyword: (event) async {
          await _filterProduct(
            emit,
            category: state.category,
            searchQuery: event.keyword,
          );
        },
      );
    }, transformer: debounceTransformer());
  }


  Future<void> _fetchProducts(Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: ProductBlocStatus.loading));
    final result = await productRepository.getProducts();
    result.fold(
        (l) => emit(state.copyWith(status: ProductBlocStatus.failure)),
        (r) => emit(state.copyWith(
            status: ProductBlocStatus.completed,
            products: r,
            originProducts: r)));
  }

  Future<void> _filterProduct(
    Emitter<ProductsState> emit, {
    required String category,
    required String searchQuery,
  }) async {
    emit(state.copyWith(status: ProductBlocStatus.loading));
    final filteredProduct = state.originProducts
        .where((element) =>
            (category.isEmpty || element.category == category) &&
            element.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    emit(state.copyWith(
        products: filteredProduct,
        status: ProductBlocStatus.completed,
        category: category,
        searchQuery: searchQuery));
  }

}
