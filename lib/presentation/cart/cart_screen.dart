import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/components/error_fetch_data_widget.dart';

import 'components/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen._({Key? key}) : super(key: key);

  static route() {
    return const CartScreen._();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.status != CartBlocStatus.success || state.totalItem==0) {
                return const SizedBox();
              }
              return IconButton(
                  tooltip: "Delete all",
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(const CartEvent.deleteAllItems());
                  },
                  icon: const Icon(
                    Icons.delete,
                  ));
            },
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status != CartBlocStatus.success || state.items.isEmpty) {
            return const SizedBox();
          }
          return Material(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: const Offset(0, -7),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total ${state.totalItem} Items',
                        style: TextStyles.h6.copyWith(
                            color: ResColor.textSecondary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'USD ${state.totalPrice}',
                        style:
                            TextStyles.h6.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Proceed to Checkout"),
                          Icon(
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state.items.isEmpty && state.status == CartBlocStatus.success){
            return SizedBox(
              width: 1.sw,
              height: 1.sw,
              child: const Center(
                child: Text("No item on the cart.", style: TextStylesLp.h3,),
              ),
            );
          }

          if (state.status == CartBlocStatus.loading ||
              state.status == CartBlocStatus.initial) {
            return SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: const Center(
                child: CircularProgressIndicator(
                  color: ResColor.primary,
                ),
              ),
            );
          }

          if (state.status == CartBlocStatus.failure) {
            return const ErrorFetchDataWidget();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.totalItem,
            itemBuilder: (BuildContext context, int index) {
              final item = state.items[index];
              return CartItemCard(
                title: item.title,
                count: item.count,
                imgUrl: item.imgUrl,
                price: item.price,
                onPressed: () {},
                onDeletePress: () {
                  context.read<CartBloc>().add(CartEvent.deleteCartItem(item));
                },
                onAmountChange: (int value) {
                  context.read<CartBloc>().add(CartEvent.changeItemAmount(value, item));
                },
              );
            },
          );
        },
      ),
    );
  }
}
