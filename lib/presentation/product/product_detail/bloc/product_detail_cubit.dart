import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/domain/entities/product_entity.dart';
import 'package:flutter_fakestoreapi/domain/repositories/cart_repository.dart';
import 'package:flutter_fakestoreapi/domain/repositories/product_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_cubit.freezed.dart';
part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final CartRepository cartRepository;
  final ProductRepository productRepository;

  ProductDetailCubit(
      {required this.cartRepository, required this.productRepository})
      : super(const ProductDetailState(
            status: ProductDetailCubitStatus.initial,
            productEntity: null));

  void iniProductEntity({ProductEntity? product, int? id}) async {
    assert((product == null && id != null) || (product != null || id == null),
        'Either entity or id must be not null');

    if (product != null) {
      
      emit(state.copyWith(
          status: ProductDetailCubitStatus.completed, 
          productEntity: product));
      return;
    }

    emit(state.copyWith(status: ProductDetailCubitStatus.loading));
    final result = await productRepository.getProductById(id!);
    result.fold(
        (l) => emit(state.copyWith(
              status: ProductDetailCubitStatus.failure,
            )),
        (r) => emit(state.copyWith(
            status: ProductDetailCubitStatus.completed,
            productEntity: product)));
  }

  void addProductToCart()async{
    assert(state.productEntity!=null);
    logDebug.i("add to cart");
    await cartRepository.addProductToCart(state.productEntity!);
    emit(state.copyWith(status: ProductDetailCubitStatus.successAddToCart));
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(status: ProductDetailCubitStatus.completed));
  }


}
