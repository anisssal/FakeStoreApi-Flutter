import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/domain/entities/cart_entity.dart';
import 'package:flutter_fakestoreapi/domain/repositories/cart_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

const _debounceDuration = Duration(milliseconds: 300);

EventTransformer<Event> debounceTransformer<Event>() {
  return (events, mapper) {
    return events.debounceTime(_debounceDuration).asyncExpand(mapper);
  };
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  StreamSubscription<List<CartEntity>>? streamSubscription;

  CartBloc({required this.cartRepository})
      : super(const CartState(
            status: CartBlocStatus.initial,
            items: [],
            changeAmountStatus: CartBlocStatus.initial)) {
    on<CartEvent>((events, emit) async {
      await events.map(
        getCartItems: (event) async {
          await _getCartItems(emit);
        },
        deleteCartItem: (event) async {
          await _deleteCartItem(emit, event.item);
        },
        deleteAllItems: (event) async {
          await _deleteAllItems(emit);
        },
        cartItemChanged: (event) {
          emit(state.copyWith(items: event.items));
        },
        changeItemAmount: (_) {},
      );
    });

    on<ChangeCartItemAmount>((events, emit) async {
      await events.map(
        getCartItems: (_) {},
        deleteCartItem: (_) {},
        deleteAllItems: (_) {},
        cartItemChanged: (_) {},
        changeItemAmount: (event)async {
          await cartRepository.changeAmountOfCart(event.cartEntity, event.amount);
        },
      );
    },
    transformer: debounceTransformer());
  }

  Future<void> _getCartItems(Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartBlocStatus.loading));
    final result = await cartRepository.getCartData();
    result.fold((l) => emit(state.copyWith(status: CartBlocStatus.failure)),
        (r) {
      emit(state.copyWith(status: CartBlocStatus.success));

      streamSubscription?.cancel();
      streamSubscription = r.listen((event) {
        add(CartEvent.cartItemChanged(event));
      });
    });
  }

  Future<void> _deleteCartItem(Emitter<CartState> emit, CartEntity item) async {
    emit(state.copyWith(status: CartBlocStatus.loading));
    await cartRepository.removeProductFromCart(item);
    emit(state.copyWith(status: CartBlocStatus.success));
  }

  Future<void> _deleteAllItems(Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartBlocStatus.loading));
    await cartRepository.removeAllProductFromCart();
    emit(state.copyWith(status: CartBlocStatus.success));
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
